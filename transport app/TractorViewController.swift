import UIKit

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!

    @IBAction func startAnimation() {
        bigWheelView.transform = CGAffineTransformIdentity
        smallWheelView.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(0.75,
                                   delay: 0,
                                   options: [.CurveLinear],
                                   animations: {
                                    self.bigWheelView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                                    self.smallWheelView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: nil)
    }
}
