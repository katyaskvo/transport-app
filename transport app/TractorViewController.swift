import UIKit

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!

    @IBAction func startAnimation() {
        UIView.animateWithDuration(1,
                                   delay: 1,
                                   options: [.Repeat, .CurveLinear],
                                   animations: {
                                    self.bigWheelView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                                    self.smallWheelView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: nil)

    }
}
