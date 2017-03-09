import UIKit
import AudioToolbox

import UIKit
import AudioToolbox

class MotorcycleViewController: UIViewController {
    
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var bodyView: UIImageView!
    @IBOutlet var bodySeatView: UIImageView!
    @IBOutlet var bodyPedalView: UIImageView!
    @IBOutlet var mainPipesView: UIImageView!
    @IBOutlet var engineRightView: UIImageView!
    @IBOutlet var engineLeftView: UIImageView!
    @IBOutlet var mirrorView: UIImageView!
    @IBOutlet var backFenderView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var backWheelReflectionView: UIImageView!
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var frontWheelReflectionView: UIImageView!
    @IBOutlet var frontFenderView: UIImageView!
    @IBOutlet var pipeView: UIImageView!
    @IBOutlet var pipe2View: UIImageView!
    @IBOutlet var part1View: UIImageView!
    @IBOutlet var part3View: UIImageView!
    @IBOutlet var springView: UIImageView!
    @IBOutlet var part2View: UIImageView!
    @IBOutlet var headlightsView: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var road2View: UIImageView!
    
    @IBOutlet weak var backLightOrangePartView: UIImageView!
    @IBOutlet weak var backLightRedView: UIImageView!
    @IBOutlet weak var backLightRedOnView: UIImageView!
    @IBOutlet weak var backLightOrangeOnView: UIImageView!
    
    @IBOutlet var cloud1View: UIImageView!
    @IBOutlet var cloud2View: UIImageView!
    @IBOutlet var cloud3View: UIImageView!
    @IBOutlet var cloud4View: UIImageView!
    @IBOutlet var cloud5View: UIImageView!
    @IBOutlet var cloud6View: UIImageView!
    @IBOutlet var cloud7View: UIImageView!
    @IBOutlet var cloud8View: UIImageView!
    
    let animationDuration = CFTimeInterval(10.0)
    
    var headlightsImages: [UIImage]!
    var steamImages: [UIImage]!
    
    func enableButton() {
        self.buttonPlay.isEnabled = true
    }
    var soundId : SystemSoundID = 0
    
    func playSound() {
        let soundUrl = Bundle.main.url(forResource: "motorcycle", withExtension: "mp3")
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
        AudioServicesPlaySystemSound(soundId)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        if soundId != 0 {
            AudioServicesDisposeSystemSoundID(soundId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headlights_01 = UIImage(named: "motorcycle_headlights01")
        let headlights_02 = UIImage(named: "motorcycle_headlights02")
        headlightsImages = [headlights_01!, headlights_02!, headlights_02!, headlights_01!, headlights_02!, headlights_01!, headlights_02!, headlights_01!, headlights_01!]
    }
    
    @IBAction func startAnimation() {
        self.buttonPlay.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)
        playSound()
        
        let headlightsAnimation = CAKeyframeAnimation(keyPath: "contents")
        headlightsAnimation.calculationMode = kCAAnimationDiscrete
        headlightsAnimation.values = headlightsImages.map {$0.cgImage as AnyObject}
        headlightsAnimation.duration = 0.5
        headlightsAnimation.repeatCount = 20
        
        let cloud = cloud1View
        let cloud2 = cloud2View
        let cloud3 = cloud3View
        let cloud4 = cloud4View
        let cloud5 = cloud5View
        let cloud6 = cloud6View
        let cloud7 = cloud7View
        let cloud8 = cloud8View
        let cloudAnimationDuration = 2.0
        let cloudAnimationRepeatCount = 5
        
        
        let cloudPath = UIBezierPath()
        cloudPath.move(to: CGPoint(x: 245,y: 474))
        cloudPath.addCurve(to: CGPoint(x: 120, y: 420), controlPoint1: CGPoint(x: 190, y: 474), controlPoint2: CGPoint(x: 120, y: 420))
        
        let cloud2Path = UIBezierPath()
        cloud2Path.move(to: CGPoint(x: 404,y: 497))
        cloud2Path.addCurve(to: CGPoint(x: 260, y: 440), controlPoint1: CGPoint(x: 330, y: 497), controlPoint2: CGPoint(x: 260, y: 440))
        
        let cloudScaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        cloudScaleAnimation.duration = cloudAnimationDuration
        cloudScaleAnimation.repeatCount = Float.infinity
        cloudScaleAnimation.keyTimes = [0, 0.1, 0.2, 0.3, 0.4, 1]
        cloudScaleAnimation.values = [0, 2, 4, 6, 8, 10]
        
        
        let cloudTransparencyAnimation = CAKeyframeAnimation(keyPath: "opacity")
        cloudTransparencyAnimation.duration = cloudAnimationDuration
        cloudTransparencyAnimation.repeatCount = Float.infinity
        cloudTransparencyAnimation.keyTimes = [0, 0.3, 1]
        cloudTransparencyAnimation.values = [1, 0.5, 0]
        
        let cloudPathAnimation = CAKeyframeAnimation(keyPath: "position")
        cloudPathAnimation.calculationMode = kCAAnimationPaced
        cloudPathAnimation.path = cloudPath.cgPath
        cloudPathAnimation.repeatCount = Float.infinity
        cloudPathAnimation.duration = cloudAnimationDuration
        
        let cloud2PathAnimation = CAKeyframeAnimation(keyPath: "position")
        cloud2PathAnimation.calculationMode = kCAAnimationPaced
        cloud2PathAnimation.path = cloud2Path.cgPath
        cloud2PathAnimation.repeatCount = Float.infinity
        cloud2PathAnimation.duration = cloudAnimationDuration
        
        let cloudAnimation = CAAnimationGroup()
        cloudAnimation.duration = cloudAnimationDuration
        cloudAnimation.repeatCount = Float(cloudAnimationRepeatCount)
        cloudAnimation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud2Animation = CAAnimationGroup()
        cloud2Animation.duration = cloudAnimationDuration
        cloud2Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud2Animation.beginTime = CACurrentMediaTime()+0.4
        cloud2Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud3Animation = CAAnimationGroup()
        cloud3Animation.duration = cloudAnimationDuration
        cloud3Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud3Animation.beginTime = CACurrentMediaTime()+1.0
        cloud3Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud4Animation = CAAnimationGroup()
        cloud4Animation.duration = cloudAnimationDuration
        cloud4Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud4Animation.beginTime = CACurrentMediaTime()+1.4
        cloud4Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]

        let cloud5Animation = CAAnimationGroup()
        cloud5Animation.duration = cloudAnimationDuration
        cloud5Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud5Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloud2PathAnimation]
        
        let cloud6Animation = CAAnimationGroup()
        cloud6Animation.duration = cloudAnimationDuration
        cloud6Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud6Animation.beginTime = CACurrentMediaTime()+0.5
        cloud6Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloud2PathAnimation]
        
        let cloud7Animation = CAAnimationGroup()
        cloud7Animation.duration = cloudAnimationDuration
        cloud7Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud7Animation.beginTime = CACurrentMediaTime()+0.9
        cloud7Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloud2PathAnimation]
        
        let cloud8Animation = CAAnimationGroup()
        cloud8Animation.duration = cloudAnimationDuration
        cloud8Animation.repeatCount = Float(cloudAnimationRepeatCount)
        cloud8Animation.beginTime = CACurrentMediaTime()+1.3
        cloud8Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloud2PathAnimation]
        

        
        self.part1View.setAnchorPoint(anchorPoint: CGPoint(x: 0.05, y: 0.5), view: self.part1View)
        self.part2View.setAnchorPoint(anchorPoint: CGPoint(x: 0.05, y: 0.5), view: self.part2View)
        self.part3View.setAnchorPoint(anchorPoint: CGPoint(x: 0.05, y: 0.5), view: self.part3View)
        self.springView.setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 1), view: self.springView)
        
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        
                        let bodyRelatedKeyTimes = [0, 0.25, 0.5, 0.75, 1]
                        
                        //Shake
                        let bodyShakeValues = [CGPoint(x: 0, y: 0.5), CGPoint(x: -0, y: -0.5), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: -0.5), CGPoint(x: 0, y: 0.5)]
                        self.bodyView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.bodyView, duration: 0.75, animationDuration: self.animationDuration)
                        self.bodySeatView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.bodySeatView, duration: 0.75, animationDuration: self.animationDuration)
                        self.bodyPedalView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.bodyPedalView, duration: 0.75, animationDuration: self.animationDuration)
                        self.engineLeftView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.engineLeftView, duration: 0.75, animationDuration: self.animationDuration)
                        self.engineRightView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.engineRightView, duration: 0.75, animationDuration: self.animationDuration)
                        self.mainPipesView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.mainPipesView, duration: 0.75, animationDuration: self.animationDuration)
                        self.mirrorView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.mirrorView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backFenderView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backFenderView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        
                        self.headlightsView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.headlightsView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backLightRedView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backLightRedView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backLightRedOnView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backLightRedOnView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backLightOrangeOnView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backLightOrangeOnView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backLightOrangePartView.shakeXY(values: bodyShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backLightOrangePartView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backWheelView.shake(values: [0, 1, 0, 1.5, 0], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backWheelView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        self.backWheelReflectionView.shake(values: [0, 1, 0, 1.5, 0], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backWheelReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        let frontFenderShakeValues = [CGPoint(x: -0.1, y: 0), CGPoint(x: 0.4, y: 1), CGPoint(x: -0.1, y: 0), CGPoint(x: 0.5, y: 1.5), CGPoint(x: -0.1, y: 0)]
                        
                        self.frontFenderView.shakeXY(values: frontFenderShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.frontFenderView, duration: 0.75, animationDuration: self.animationDuration)
                        self.frontWheelView.shakeXY(values: frontFenderShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.frontWheelView, duration: 0.75, animationDuration: self.animationDuration)
                        self.frontWheelReflectionView.shakeXY(values: frontFenderShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.frontWheelReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        
                        //Wheels
                        self.backWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.frontWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.backWheelReflectionView.animateWheelReflection(values: [0, M_PI * 0.02, 0, M_PI * (-0.03), 0 ], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.backWheelReflectionView, duration: 0.5, animationDuration: self.animationDuration)
                        self.frontWheelReflectionView.animateWheelReflection(values: [0, M_PI * 0.02, 0, M_PI * (-0.03), 0 ], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.frontWheelReflectionView, duration: 0.5, animationDuration: self.animationDuration)
                        
                        //Headlights Shine
                        self.headlightsView.layer.add(headlightsAnimation, forKey: "contents")
                        self.headlightsView.fadeInanOut(values: [0, 1, 1, 0], animatedImageView: self.headlightsView, keytimes: [0, 0.02, 0.98, 1], duration: 10, animationDuration: self.animationDuration)
                        
                        self.backLightRedOnView.fadeInanOut(values: [0, 1, 1, 0], animatedImageView: self.backLightRedOnView, keytimes: [0, 0.02, 0.98, 1], duration: 10, animationDuration: self.animationDuration)
                        self.backLightOrangeOnView.fadeInanOut(values: [0, 1, 1, 0], animatedImageView: self.backLightOrangeOnView, keytimes: [0, 0.02, 0.98, 1], duration: 10, animationDuration: self.animationDuration)
                        
//                        //Engine scale
//                        let engineStretchValues = [0.99, 1.01, 0.99, 1.01, 0.99]
//                        self.engineRightView.stretchXY(values: engineStretchValues, animatedImageView: self.engineRightView, keytimes: [0, 0.25, 0.5, 0.75, 1], duration: 0.3, animationDuration: self.animationDuration)
//                        self.engineLeftView.stretchXY(values: engineStretchValues, animatedImageView: self.engineLeftView, keytimes: [0, 0.25, 0.5, 0.75, 1], duration: 0.3, animationDuration: self.animationDuration)
//                        
                        
                        
                        //Steam Animation
                        //
                        cloud?.layer.add(cloudAnimation, forKey: "animate cloud position")
                        cloud2?.layer.add(cloud2Animation, forKey: "animate cloud position")
                        cloud3?.layer.add(cloud3Animation, forKey: "animate cloud position")
                        cloud4?.layer.add(cloud4Animation, forKey: "animate cloud position")
                        cloud5?.layer.add(cloud5Animation, forKey: "animate cloud position")
                        cloud6?.layer.add(cloud6Animation, forKey: "animate cloud position")
                        cloud7?.layer.add(cloud7Animation, forKey: "animate cloud position")
                        cloud8?.layer.add(cloud8Animation, forKey: "animate cloud position")
                        
                        
                        self.pipeView.stretchX(animatedImageView: self.pipeView, values: [1, 1.03, 1, 1.03, 1], keytimes: bodyRelatedKeyTimes as [NSNumber], duration: 0.75, animationDuration: self.animationDuration)
                        
                        let pipeShakeValues = [CGPoint(x: 0, y: 0.75), CGPoint(x: -2, y: -0.75), CGPoint(x: 0, y: 1.5), CGPoint(x: -2, y: -0.75), CGPoint(x: 0, y: 0.75)]
                        let pipe2ShakeValues = [CGPoint(x: -2, y: 0.75), CGPoint(x: 0, y: -0.75), CGPoint(x: -2, y: 1.5), CGPoint(x: 0, y: -0.75), CGPoint(x: -2, y: 0.75)]

                        self.pipeView.shakeXY(values: pipeShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.pipeView, duration: 0.75, animationDuration: self.animationDuration)
                        self.pipe2View.stretchX(animatedImageView: self.pipe2View, values: [1.03, 1, 1.03, 1, 1.03], keytimes: bodyRelatedKeyTimes as [NSNumber], duration: 0.75, animationDuration: self.animationDuration)
                        self.pipe2View.shakeXY(values: pipe2ShakeValues as [NSValue], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.pipe2View, duration: 0.75, animationDuration: self.animationDuration)
                        
                        
                        //parts rotation
                        self.part1View.animateWheelReflection(values: [M_PI * 0.001, M_PI * (-0.0015), M_PI * 0.001, M_PI * (-0.0015), M_PI * 0.001], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.part1View, duration: 0.75, animationDuration: self.animationDuration)
                        self.part2View.animateWheelReflection(values: [M_PI * 0.001, M_PI * (-0.0015), M_PI * 0.001, M_PI * (-0.0015), M_PI * 0.001], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.part2View, duration: 0.75, animationDuration: self.animationDuration)
                        self.part3View.animateWheelReflection(values: [M_PI * 0.001, M_PI * (-0.0015), M_PI * 0.001, M_PI * (-0.0015), M_PI * 0.001], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.part3View, duration: 0.75, animationDuration: self.animationDuration)
                        self.springView.animateWheelReflection(values: [M_PI * 0.006, M_PI * (-0.001), M_PI * 0.008, M_PI * (-0.001), M_PI * 0.006], keyTimes: bodyRelatedKeyTimes as [NSNumber], animatedImageView: self.springView, duration: 0.75, animationDuration: self.animationDuration)
                        self.springView.stretchXY(values: [0.99, 1, 0.98, 1, 0.99 ], animatedImageView: self.springView, keytimes: bodyRelatedKeyTimes as [NSNumber], duration: 0.75, animationDuration: self.animationDuration
                        )
                        
                        //Road
                        self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1, animationDuration: self.animationDuration)
                        
        }, completion: nil)
    }
}

