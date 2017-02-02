import UIKit

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval, repeatCount: Float, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = repeatCount
        
        if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func animateWheelReflection( values: [Double], keyTimes: [NSNumber
        ], animatedImageView: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let wheelReflectionAnimation = CAKeyframeAnimation()
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            wheelReflectionAnimation.keyPath = "transform.rotation"
            wheelReflectionAnimation.values = values
            wheelReflectionAnimation.keyTimes = keyTimes
            wheelReflectionAnimation.duration = duration
            wheelReflectionAnimation.repeatCount = repeatCount
            
            animatedImageView.layer.add(wheelReflectionAnimation, forKey: "move")
        }, completion: nil)
    }

    func shake( values: [Double], keyTimes: [NSNumber
        ], animatedImageView: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let repeatCount = Float(animationDuration / duration)
        
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            shakeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            shakeAnimation.duration = duration
            shakeAnimation.values = values
            shakeAnimation.keyTimes = keyTimes
            shakeAnimation.repeatCount = repeatCount
            animatedImageView.layer.add(shakeAnimation, forKey: "shake")
        }, completion: nil)
    }

    
    func moveTheRoad(road1View: UIImageView, road2View: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let animationOptions = UIViewAnimationOptions.curveLinear
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, options: animationOptions, animations: {

            UIView.setAnimationRepeatCount(repeatCount)
            UIView.setAnimationDuration(duration)
            
            road1View.frame = road1View.frame.offsetBy(dx: -1 * road1View.frame.size.width, dy: 0.0)
            road2View.frame = road2View.frame.offsetBy(dx: -1 * road2View.frame.size.width, dy: 0.0)
        }, completion: { (Bool) -> Void in
            road1View.frame = road1View.frame.offsetBy(dx: 1 * road1View.frame.size.width, dy: 0.0)
            road2View.frame = road2View.frame.offsetBy(dx: 1 * road2View.frame.size.width, dy: 0.0)
        })
    }
    
    func moveClouds(mainView: UIView, cloud1View: UIImageView, cloud1AView: UIImageView, cloud2View: UIImageView, cloud2AView: UIImageView, cloud3View: UIImageView, cloud3AView: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let animationOptions = UIViewAnimationOptions.curveLinear
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, options: animationOptions, animations: {
            
            UIView.setAnimationRepeatCount(repeatCount)
            UIView.setAnimationDuration(duration)
            
            cloud1View.frame = cloud1View.frame.offsetBy(dx: -1 * mainView.frame.size.width, dy: 0.0)
            cloud1AView.frame = cloud1AView.frame.offsetBy(dx: -1 * mainView.frame.size.width, dy: 0.0)
            cloud2View.frame = cloud2View.frame.offsetBy(dx: -1 * mainView.frame.size.width, dy: 0.0)
            cloud2AView.frame = cloud2AView.frame.offsetBy(dx: -1 * mainView.frame.size.width, dy: 0.0)
            cloud3View.frame = cloud3View.frame.offsetBy(dx: -1 * mainView.frame.size.width, dy: 0.0)
            cloud3AView.frame = cloud3AView.frame.offsetBy(dx: -1 * mainView.frame.size.width, dy: 0.0)
        }, completion: { (Bool) -> Void in
            cloud1View.frame = cloud1View.frame.offsetBy(dx: 1 * mainView.frame.size.width, dy: 0.0)
            cloud1AView.frame = cloud1AView.frame.offsetBy(dx: 1 * mainView.frame.size.width, dy: 0.0)
            cloud2View.frame = cloud2View.frame.offsetBy(dx: 1 * mainView.frame.size.width, dy: 0.0)
            cloud2AView.frame = cloud2AView.frame.offsetBy(dx: 1 * mainView.frame.size.width, dy: 0.0)
            cloud3View.frame = cloud3View.frame.offsetBy(dx: 1 * mainView.frame.size.width, dy: 0.0)
            cloud3AView.frame = cloud3AView.frame.offsetBy(dx: 1 * mainView.frame.size.width, dy: 0.0)
        })
    }
    
}
extension UIViewKeyframeAnimationOptions {
    
    init(animationOptions: UIViewAnimationOptions) {
        rawValue = animationOptions.rawValue
    }
    
}
