import UIKit
import AudioToolbox
import MediaPlayer
import AVFoundation

class BeetleViewController: UIViewController {
    
    @IBOutlet var sliderSoundView: MPVolumeView!
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var buttonClakson: UIButton!
    @IBOutlet var bodyView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var backWheelReflectionView: UIImageView!
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var frontWheelReflectionView: UIImageView!
    @IBOutlet var windowReflectionView: UIImageView!
    @IBOutlet var pipeView: UIImageView!
    @IBOutlet var fenderBackView: UIImageView!
    @IBOutlet var parkingLightOnView: UIImageView!
    @IBOutlet var headlightsView: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var road2View: UIImageView!
    @IBOutlet var cloud1View: UIImageView!
    @IBOutlet var cloud2View: UIImageView!
    @IBOutlet var cloud3View: UIImageView!
    @IBOutlet var cloud4View: UIImageView!
    
    let animationDuration = CFTimeInterval(10.0)
    
    var headlightsImages: [UIImage]!
    var steamImages: [UIImage]!
    
    func enableButton() {
        self.buttonPlay.isEnabled = true
    }
    
    func enableBeepButton() {
        self.buttonClakson.isEnabled = true
    }
    var audioPlayer: AVAudioPlayer!
    var audioPlayerBeep: AVAudioPlayer!
    
    override func viewDidDisappear(_ animated: Bool) {
        self.audioPlayer.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headlights_01 = UIImage(named: "headlights01")
        let headlights_02 = UIImage(named: "headlights02")
        headlightsImages = [headlights_01!, headlights_02!, headlights_02!, headlights_01!, headlights_02!, headlights_01!, headlights_02!, headlights_01!, headlights_01!]
        
        let steamCloud_01 = UIImage(named: "steamCloud01")
        let steamCloud_02 = UIImage(named: "steamCloud02")
        steamImages = [steamCloud_01!, steamCloud_02!, steamCloud_01!, steamCloud_02!, steamCloud_01!, steamCloud_02!, steamCloud_01!, steamCloud_02!, steamCloud_01!]
        
        
        if let filePath = Bundle.main.path(forResource: "bug_mechanical", ofType: "mp3", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePath)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: filePathUrl)
            } catch {
                print(error)
            }
        } else {
            print("filePath is empty!")
        }
        
        if let filePathBeep = Bundle.main.path(forResource: "bug_beep", ofType: "mp3", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePathBeep)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayerBeep = try AVAudioPlayer(contentsOf: filePathUrl)
            } catch {
                print(error)
            }
        } else {
            print("filePath is empty!")
        }

        sliderSoundView.showsRouteButton = false
        sliderSoundView.setVolumeThumbImage(UIImage(named:"volume"), for: UIControlState.normal)
        sliderSoundView.setMaximumVolumeSliderImage(UIImage(named:"min_volume"), for: UIControlState.normal)
        sliderSoundView.setMinimumVolumeSliderImage(UIImage(named:"max_volume"), for: UIControlState.normal)

    }

    @IBAction func playSoundButton() {
        self.audioPlayer.play()
    }
    
    @IBAction func playBeepButton() {
        self.audioPlayerBeep.play()
    }
    
    
    @IBAction func playBeep(_ sender: Any) {
        
        self.buttonClakson.isEnabled = false
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(enableBeepButton), userInfo: nil, repeats: false)
        
        self.audioPlayerBeep.play()
        
    }
    
    @IBAction func startAnimation() {
        self.buttonPlay.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)
        
        let headlightsAnimation = CAKeyframeAnimation(keyPath: "contents")
        headlightsAnimation.calculationMode = kCAAnimationDiscrete
        headlightsAnimation.values = headlightsImages.map {$0.cgImage as AnyObject}
        headlightsAnimation.duration = 0.5
        headlightsAnimation.repeatCount = 20

        let cloud = cloud1View
        let cloud2 = cloud2View
        let cloud3 = cloud3View
        let cloud4 = cloud4View
        let cloudAnimationDuration = 2.0
        let cloudAnimationRepeatCount = 5
        
        
        let cloudPath = UIBezierPath()
        cloudPath.move(to: CGPoint(x: 165,y: 284))
        cloudPath.addCurve(to: CGPoint(x: 30, y: 230), controlPoint1: CGPoint(x: 80, y: 284), controlPoint2: CGPoint(x: 30, y: 230))
        
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
        
        
        
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        
                        //Shake
                        self.bodyView.shake(values: [0.75, -0.75, 0.75, -0.75, 0.75], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.bodyView, duration: 0.75, animationDuration: self.animationDuration)
                        self.headlightsView.shake(values: [0.75, -0.75, 0.75, -0.75, 0.75], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.headlightsView, duration: 0.75, animationDuration: self.animationDuration)
                        self.windowReflectionView.shake(values: [0.25, -0.25, 0.25, -0.25, 0.25], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.windowReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        self.pipeView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.pipeView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backWheelView.shake(values: [0, 1, 0, 1.5, 0], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.backWheelView, duration: 0.75, animationDuration: self.animationDuration)
                        self.backWheelReflectionView.shake(values: [0, 1, 0, 1.5, 0], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.backWheelReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        self.frontWheelView.shake(values: [0, 1.5, 0, 1, 0], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.frontWheelView, duration: 0.75, animationDuration: self.animationDuration)
                        self.frontWheelReflectionView.shake(values: [0, 1.5, 0, 1, 0], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.frontWheelReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        self.fenderBackView.shake(values: [0.75, -0.75, 0.75, -0.75, 0.75], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.fenderBackView, duration: 0.75, animationDuration: self.animationDuration)
                        self.parkingLightOnView.shake(values: [0.75, -0.75, 0.75, -0.75, 0.75], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.parkingLightOnView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        
                        //Wheels
                        self.backWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.frontWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.backWheelReflectionView.animateWheelReflection(values: [0, M_PI * 0.02, 0, M_PI * (-0.03), 0 ], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.backWheelReflectionView, duration: 0.5, animationDuration: self.animationDuration)
                        self.frontWheelReflectionView.animateWheelReflection(values: [0, M_PI * 0.02, 0, M_PI * (-0.03), 0 ], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.frontWheelReflectionView, duration: 0.5, animationDuration: self.animationDuration)
                        
                        //Headlights Shine
                        self.headlightsView.layer.add(headlightsAnimation, forKey: "contents")
                        self.headlightsView.fadeInanOut(values: [0, 1, 1, 0], animatedImageView: self.headlightsView, keytimes: [0, 0.02, 0.98, 1], duration: 10, animationDuration: self.animationDuration)
                        self.parkingLightOnView.fadeInanOut(values: [0, 1, 1, 0], animatedImageView: self.parkingLightOnView, keytimes: [0, 0.02, 0.98, 1], duration: 10, animationDuration: self.animationDuration)
                        
                        //Steam Animation
//                
                        cloud?.layer.add(cloudAnimation, forKey: "animate cloud position")
                        cloud2?.layer.add(cloud2Animation, forKey: "animate cloud position")
                        cloud3?.layer.add(cloud3Animation, forKey: "animate cloud position")
                        cloud4?.layer.add(cloud4Animation, forKey: "animate cloud position")
                        
                        self.pipeView.stretchX(animatedImageView: self.pipeView, values: [1, 1.07, 1, 1.07, 1], keytimes: [0, 0.25, 0.5, 0.75, 1], duration: 0.7, animationDuration: self.animationDuration)

                        
                        //Road
                        self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1, animationDuration: self.animationDuration)
                        
        }, completion: nil)
    }
}
