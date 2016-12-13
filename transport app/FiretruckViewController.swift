import UIKit

class FiretruckViewController: UIViewController {
    @IBOutlet var firetruckBodyView: UIImageView!
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var road2View: UIImageView!
    
    @IBOutlet var firetruckHoldersView: UIImageView!
    @IBOutlet var light1View: UIImageView!
    @IBOutlet var light2View: UIImageView!
    @IBOutlet var light3View: UIImageView!
    @IBOutlet var light4View: UIImageView!
    @IBOutlet var light5View: UIImageView!
    @IBOutlet var syrenView: UIImageView!
    
    
    @IBOutlet var reflectionBackWheelView: UIImageView!
    @IBOutlet var reflectionFrontWheelView: UIImageView!
    
    let animationDuration = CFTimeInterval(10.0)
    
    @IBAction func startAnimation() {
        frontWheelView.transform = CGAffineTransform.identity
        backWheelView.transform = CGAffineTransform.identity
        
        
        reflectionBackWheelView.transform = CGAffineTransform.identity
        reflectionFrontWheelView.transform = CGAffineTransform.identity
        
        road1View.transform = CGAffineTransform.identity
        road2View.transform = CGAffineTransform.identity
//        syrenShineView.transform = CGAffineTransform.identity
//        syrenShineView.alpha = 1
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        UIView.setAnimationRepeatCount(15)

//                        self.syrenShineView.alpha = 0
                        UIView.setAnimationDuration(0.4)
                        UIView.setAnimationRepeatCount(30)
                        self.frontWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.backWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1, animationDuration: self.animationDuration)
                        
                        //Wheel Reflection
                        self.reflectionBackWheelView.animateWheelReflection(values: [M_PI * 0.015, M_PI * (-0.02), M_PI * 0.015 ], keyTimes: [0, 0.5, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.3, animationDuration: self.animationDuration)
                        self.reflectionFrontWheelView.animateWheelReflection(values: [M_PI * 0.015, M_PI * (-0.02), M_PI * 0.015 ], keyTimes: [0, 0.5, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.3, animationDuration: self.animationDuration)
                        
                        //Shake
                        self.firetruckBodyView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.firetruckBodyView, duration: 0.7, animationDuration: self.animationDuration)
                        self.firetruckHoldersView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.firetruckHoldersView, duration: 0.7, animationDuration: self.animationDuration)
                        self.light5View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light5View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light4View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light4View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light3View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light3View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light2View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light2View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light1View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light1View, duration: 0.7, animationDuration: self.animationDuration)
                        self.syrenView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.syrenView, duration: 0.7, animationDuration: self.animationDuration)
                        
                        
        }, completion: nil)
    }
}
