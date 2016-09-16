import UIKit

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!
    @IBOutlet var cloudView: UIImageView!

    @IBAction func startAnimation() {
        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        cloudView.transform = CGAffineTransform.identity
        cloudView.alpha = 1
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        UIView.setAnimationRepeatCount(5)
                        self.cloudView.transform = CGAffineTransform(translationX: 100, y: -100).scaledBy(x: 5, y: 5)

                        self.cloudView.alpha = 0
                        UIView.setAnimationDuration(4)
                        UIView.setAnimationRepeatCount(3)
                        self.bigWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 3))
                        self.smallWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }, completion: nil)
    }
}
