import UIKit

class HelicopterViewController: UIViewController {

    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var heliTailView: UIImageView!
    @IBOutlet var helixView: UIImageView!
    @IBOutlet var helixStillView: UIImageView!
    @IBOutlet var heliTailRotatingView: UIImageView!
    @IBOutlet var helicopterBodyView: UIImageView!
    @IBOutlet var pimpochkaView: UIImageView!
    @IBOutlet var reflectionFrontView: UIImageView!
    @IBOutlet var reflectionSideView: UIImageView!
    
    
    let animationDuration = CFTimeInterval(10.0)
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
        
        
        heliTailRotatingView.alpha = 0
    }
    
    
    func enableButton() {
        self.buttonPlay.isEnabled = true
    }
    
    @IBAction func startAnimation() {
        self.buttonPlay.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)
        heliTailView.transform = CGAffineTransform.identity
        helixStillView.transform = CGAffineTransform.identity
        
        let stillViewDisappearAnimation = CAKeyframeAnimation(keyPath: "opacity")
        stillViewDisappearAnimation.duration = 10
        stillViewDisappearAnimation.repeatCount = 1
        stillViewDisappearAnimation.keyTimes = [0, 0.01, 0.99, 1]
        stillViewDisappearAnimation.values = [1, 0, 0, 1]
        
        let heliTailAppearAnimation = CAKeyframeAnimation(keyPath: "opacity")
        heliTailAppearAnimation.duration = 10
        heliTailAppearAnimation.repeatCount = 1
        heliTailAppearAnimation.keyTimes = [0, 0.01, 0.99, 1]
        heliTailAppearAnimation.values = [0, 1, 1, 0]
        
        let helixViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        helixViewAnimation.calculationMode = kCAAnimationDiscrete
        helixViewAnimation.values = helixImages.map {$0.cgImage as AnyObject}
        helixViewAnimation.duration = 0.5
        helixViewAnimation.repeatCount = 20
        
        let reflectionRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        reflectionRotationAnimation.duration = 5
        reflectionRotationAnimation.repeatCount = 2
        reflectionRotationAnimation.keyTimes = [0, 0.2, 0.55, 0.85, 1]
        reflectionRotationAnimation.values = [0, CGFloat(M_PI_2 * -0.02), CGFloat(M_PI_2 * ( 0.04)), CGFloat(M_PI_2 * -0.02), 0]

        
        UIView.animate(withDuration: 0.75,
                                   delay: 0,
                                   options: [.curveLinear],
                                   animations: {
                                    
                                    //helix
                                    self.heliTailView.layer.add(stillViewDisappearAnimation, forKey: "opacity")
                                    self.helixStillView.layer.add(stillViewDisappearAnimation, forKey: "opacity")
                                    
                                    //helitail
                                    self.heliTailRotatingView.rotate360Degrees(duration: 2, repeatCount: 5)
                                    self.heliTailRotatingView.layer.add(heliTailAppearAnimation, forKey: "opacity")
                                    self.helixView.layer.add(helixViewAnimation, forKey: "helix on")
                                    
                                    //Shake
                                    self.helicopterBodyView.shake(values: [0, 15, -20, 10, 0], keyTimes: [0, 0.2, 0.55, 0.85, 1], animatedImageView: self.helicopterBodyView, duration: 5, animationDuration: self.animationDuration)
                                    self.helixView.shake(values: [0, 15, -20, 10, 0], keyTimes: [0, 0.2, 0.55, 0.85, 1], animatedImageView: self.helixView, duration: 5, animationDuration: self.animationDuration)
                                    self.heliTailRotatingView.shake(values: [0, 15, -20, 10, 0], keyTimes: [0, 0.2, 0.55, 0.85, 1], animatedImageView:
                                        self.heliTailRotatingView, duration: 5, animationDuration: self.animationDuration)
                                    self.pimpochkaView.shake(values: [0, 15, -20, 10, 0], keyTimes: [0, 0.2, 0.55, 0.85, 1], animatedImageView: self.pimpochkaView, duration: 5, animationDuration: self.animationDuration)
                                    self.reflectionFrontView.shake(values: [0, 12, -17, 7, 0], keyTimes: [0, 0.2, 0.55, 0.85, 1], animatedImageView: self.reflectionFrontView, duration: 5, animationDuration: self.animationDuration)
                                    self.reflectionFrontView.layer.add(reflectionRotationAnimation, forKey: "rotation")
                                    self.reflectionSideView.shake(values: [0, 13, -17, 8, 0], keyTimes: [0, 0.2, 0.55, 0.85, 1], animatedImageView: self.reflectionSideView, duration: 5, animationDuration: self.animationDuration)
                                    
        }, completion: nil)
    }
}
