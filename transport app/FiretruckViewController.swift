import UIKit

class FiretruckViewController: UIViewController {
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var syrenView: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var road2View: UIImageView!
//    @IBOutlet var syrenShineView: UIImageView!
    
    
    let animationDuration = CFTimeInterval(10.0)
    
    @IBAction func startAnimation() {
        frontWheelView.transform = CGAffineTransform.identity
        backWheelView.transform = CGAffineTransform.identity
        
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
        }, completion: nil)
    }
}
