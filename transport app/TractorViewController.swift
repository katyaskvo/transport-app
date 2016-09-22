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
        let square = cloudView!

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 583,y: 255))
        path.addCurve(to: CGPoint(x: 610, y: 28), controlPoint1: CGPoint(x: 700, y: 197), controlPoint2: CGPoint(x: 450, y: 121))

        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")

        // set the animations path to our bezier curve
        anim.path = path.cgPath

        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0

        // we add the animation to the squares 'layer' property
        square.layer.add(anim, forKey: "animate position along path")

//        playSound()
        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        cloudView.transform = CGAffineTransform.identity
        cloudView.alpha = 1
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        UIView.setAnimationRepeatCount(3)
                        self.cloudView.transform = CGAffineTransform(scaleX: 5, y: 5)

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
