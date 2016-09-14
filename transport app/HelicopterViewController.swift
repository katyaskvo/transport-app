import UIKit

class HelicopterViewController: UIViewController {

    @IBOutlet var heliTailView: UIImageView!
    
    @IBAction func startAnimation() {
        heliTailView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.75,
                                   delay: 0,
                                   options: [.curveLinear],
                                   animations: {
                                    self.heliTailView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }, completion: nil)
    }
}
