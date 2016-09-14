import UIKit

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!

    @IBAction func startAnimation() {
        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.75,
                                   delay: 0,
                                   options: [.curveLinear],
                                   animations: {
                                    self.bigWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                                    self.smallWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }, completion: nil)
    }
}
