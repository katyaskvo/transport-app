import UIKit

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!

    func startRotatingWheels() {
        UIView.animateWithDuration(1,
                                   delay: 1,
                                   options: [.Repeat, .CurveLinear],
                                   animations: {
                                    self.bigWheelView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                                    self.smallWheelView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: nil)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        startRotatingWheels()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
