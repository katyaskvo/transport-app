import UIKit
import AudioToolbox

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!
    @IBOutlet var cloudView: UIImageView!
    
    func playSound() {
        let mainBundle = Bundle.main

        let soundUrl = mainBundle.url(forResource: "tractor", withExtension: "caf")
        var soundId : SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)

        AudioServicesPlaySystemSound(soundId)
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
                        UIView.setAnimationDuration(5)
                        UIView.setAnimationRepeatCount(3)
                        self.bigWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 3))
                        UIView.setAnimationDuration(3)
                        UIView.setAnimationRepeatCount(5)
                        self.smallWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 3))
                       
            }, completion: nil)
    }
}
