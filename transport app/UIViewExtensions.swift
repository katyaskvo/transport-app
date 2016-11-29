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

    func shake( values: [Double], animatedImageView: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let repeatCount = Float(animationDuration / duration)
        
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            shakeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            shakeAnimation.duration = duration
            shakeAnimation.values = values
            shakeAnimation.repeatCount = repeatCount
            animatedImageView.layer.add(shakeAnimation, forKey: "shake")
        }, completion: nil)
    }

}
