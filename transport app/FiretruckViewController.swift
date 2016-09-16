import UIKit

class FiretruckViewController: UIViewController {
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var syrenView: UIImageView!
    @IBOutlet var syrenShineView: UIImageView!
    @IBAction func startAnimation() {
        frontWheelView.transform = CGAffineTransform.identity
        backWheelView.transform = CGAffineTransform.identity
        syrenShineView.transform = CGAffineTransform.identity
        syrenShineView.alpha = 1
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        UIView.setAnimationRepeatCount(15)

                        self.syrenShineView.alpha = 0
                        UIView.setAnimationDuration(0.4)
                        UIView.setAnimationRepeatCount(30)
                        self.frontWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 5))
                        self.backWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2 / 5))
            }, completion: nil)
    }
}
