import UIKit
import AudioToolbox

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!
    @IBOutlet var cloudView: UIImageView!
    @IBOutlet var reflectionBackWheelView: UIImageView!
    @IBOutlet var reflectionFrontWheelView: UIImageView!
    
    var soundId : SystemSoundID = 0
    let animationDuration = CFTimeInterval(10.0)

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
                        self.smallWheelView.rotate360Degrees(duration: 4, repeatCount: 2.5)
                        self.bigWheelView.rotate360Degrees(duration: 5, repeatCount: 2)
                        self.reflectionBackWheelView.animateWheelReflection(values: [0, M_PI * 0.04, 0, 0, M_PI * (-0.06), 0 ], keyTimes: [0, 0.15, 0.35, 0.65, 0.85, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.8, animationDuration: self.animationDuration)
                        self.reflectionFrontWheelView.animateWheelReflection(values: [0, M_PI * 0.04, 0, 0, M_PI * (-0.06), 0 ], keyTimes: [0, 0.15, 0.35, 0.65, 0.85, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.8, animationDuration: self.animationDuration)
                       
            }, completion: nil)
    }
}
