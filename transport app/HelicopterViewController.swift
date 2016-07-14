import UIKit

class HelicopterViewController: UIViewController {

    @IBOutlet var heliTailView: UIImageView!
    
    @IBAction func startAnimation() {
        heliTailView.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(0.75,
                                   delay: 0,
                                   options: [.CurveLinear],
                                   animations: {
                                    self.heliTailView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: nil)
    }
}
