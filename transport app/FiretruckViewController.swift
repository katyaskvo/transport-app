import UIKit

class FiretruckViewController: UIViewController {
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var syrenView: UIImageView!

    @IBAction func startAnimation() {
        frontWheelView.transform = CGAffineTransform.identity
        backWheelView.transform = CGAffineTransform.identity
        syrenView.transform = CGAffineTransform.identity
        syrenView.alpha = 1
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        UIView.setAnimationRepeatCount(5)
                        self.syrenView.transform = CGAffineTransform(translationX: 100, y: -100).scaledBy(x: 5, y: 5)

                        self.syrenView.alpha = 0
                        UIView.setAnimationDuration(4)
                        UIView.setAnimationRepeatCount(3)
                        self.frontWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 3))
                        self.backWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }, completion: nil)
    }
}
