import UIKit

class HelicopterViewController: UIViewController {

    @IBOutlet var heliTailView: UIImageView!
    @IBOutlet var helixView: UIImageView!
    
    var helixImages: [UIImage]!
    var animatedHelix: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let helix_00 = UIImage(named: "helicopter_helix00")
        let helix_01 = UIImage(named: "helicopter_helix01")
        let helix_02 = UIImage(named: "helicopter_helix02")
        let helix_03 = UIImage(named: "helicopter_helix03")
        let helix_04 = UIImage(named: "helicopter_helix04")
        let helix_05 = UIImage(named: "helicopter_helix05")
        helixImages = [helix_00!, helix_01!, helix_02!, helix_03!, helix_04!, helix_05!]
        }
    
    @IBAction func startAnimation() {
        heliTailView.transform = CGAffineTransform.identity
        
        let helixViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        helixViewAnimation.calculationMode = kCAAnimationDiscrete
        helixViewAnimation.values = helixImages.map {$0.cgImage as AnyObject}
        helixViewAnimation.duration = 0.5
        helixViewAnimation.repeatCount = 20
        
        UIView.animate(withDuration: 0.75,
                                   delay: 0,
                                   options: [.curveLinear],
                                   animations: {
                                    self.heliTailView.rotate360Degrees(duration: 0.2, repeatCount: 50)
                                    
        self.helixView.layer.add(helixViewAnimation, forKey: "contents")
//                                    self.heliTailView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }, completion: nil)
    }
}
