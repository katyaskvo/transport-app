import UIKit
import AudioToolbox

class TractorViewController: UIViewController {
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!
    @IBOutlet var cloudView: UIImageView!
    @IBOutlet var reflectionBackWheelView: UIImageView!
    @IBOutlet var reflectionFrontWheelView: UIImageView!
    @IBOutlet var tractorBodyView: UIImageView!
    
    @IBOutlet var fenderFrontView: UIImageView!
    @IBOutlet var fenderBackView: UIImageView!
    @IBOutlet var exhaustPipeView: UIImageView!
    @IBOutlet var whindowReflectionView: UIImageView!
    
    @IBOutlet var road2View: UIImageView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    
    var soundId : SystemSoundID = 0
    let animationDuration = CFTimeInterval(10.0)

    func playSound() {
        if soundId == 0 {
            let soundUrl = Bundle.main.url(forResource: "tractor", withExtension: "caf")
            AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
            AudioServicesPlaySystemSound(soundId)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        if soundId != 0 {
            AudioServicesDisposeSystemSoundID(soundId)
        }
    }
    
    func stretchY(duration: CFTimeInterval) {
        let pipeStretchAnimation = CAKeyframeAnimation()
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            pipeStretchAnimation.keyPath = "transform.scale.y"
            pipeStretchAnimation.values = [1, 1.07, 1, 1.07, 1]
            pipeStretchAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
            pipeStretchAnimation.duration = duration
            pipeStretchAnimation.repeatCount = repeatCount
            
            self.exhaustPipeView.layer.add(pipeStretchAnimation, forKey: "move")
            
        }, completion: nil)
    }

    
    @IBAction func startAnimation() {
        playSound()
        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        cloudView.transform = CGAffineTransform.identity
        cloudView.alpha = 1
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        UIView.setAnimationRepeatCount(5)
                        self.cloudView.transform = CGAffineTransform(translationX: 100, y: -100).scaledBy(x: 5, y: 5)

                        self.cloudView.alpha = 0
                        
                        
        //Shake
                        self.tractorBodyView.shake(values: [1, -2, 1, -2, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.tractorBodyView, duration: 0.75, animationDuration: self.animationDuration)
                        self.whindowReflectionView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.whindowReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        self.exhaustPipeView.shake(values: [1, -5, 1, -5, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.exhaustPipeView, duration: 0.75, animationDuration: self.animationDuration)
                        self.fenderBackView.shake(values: [0, 1, -2, 1, -2, 0], keyTimes: [0, 0.1, 0.35, 0.6, 0.85, 1], animatedImageView: self.fenderBackView, duration: 0.75, animationDuration: self.animationDuration)
                        self.fenderFrontView.shake(values: [0, 1, -2, 1, -2, 0], keyTimes: [0, 0.1, 0.35, 0.6, 0.85, 1], animatedImageView: self.fenderFrontView, duration: 0.75, animationDuration: self.animationDuration)
        //Wheels
                        self.smallWheelView.rotate360Degrees(duration: 4, repeatCount: 2.5)
                        self.bigWheelView.rotate360Degrees(duration: 5, repeatCount: 2)
                        self.reflectionBackWheelView.animateWheelReflection(values: [0, M_PI * 0.04, 0, 0, M_PI * (-0.06), 0 ], keyTimes: [0, 0.15, 0.35, 0.65, 0.85, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.8, animationDuration: self.animationDuration)
                        self.reflectionFrontWheelView.animateWheelReflection(values: [0, M_PI * 0.04, 0, 0, M_PI * (-0.06), 0 ], keyTimes: [0, 0.15, 0.35, 0.65, 0.85, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.8, animationDuration: self.animationDuration)
                        
        //Road
                        self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 5, animationDuration: self.animationDuration)
                        
        //Pipe
                        self.stretchY(duration: 0.75)
                       
            }, completion: nil)
    }
}
