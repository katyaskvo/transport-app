import UIKit

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!

    @IBAction func startAnimation() {
        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        UIView.setAnimationRepeatCount(2)
                        self.bigWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 3))
                        self.smallWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }, completion: nil)
    }
}
