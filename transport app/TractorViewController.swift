import UIKit
import AudioToolbox

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!
    @IBOutlet var cloudView: UIImageView!
    var soundId : SystemSoundID = 0

    func playSound() {
        if soundId == 0 {
            let soundUrl = Bundle.main.url(forResource: "tractor", withExtension: "caf")
            AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
            AudioServicesPlaySystemSound(soundId)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        if soundId != 0 {
            AudioServicesDisposeSystemSoundID(soundId)
        }
    }

    @IBAction func startAnimation() {
        playSound()
        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        cloudView.transform = CGAffineTransform.identity
        cloudView.alpha = 1
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        UIView.setAnimationRepeatCount(5)
                        self.cloudView.transform = CGAffineTransform(translationX: 100, y: -100).scaledBy(x: 5, y: 5)

                        self.cloudView.alpha = 0
                        self.smallWheelView.rotate360Degrees(duration: 3.33, repeatCount: 3)
                        self.bigWheelView.rotate360Degrees(duration: 5, repeatCount: 2)
                       
            }, completion: nil)
    }
}
