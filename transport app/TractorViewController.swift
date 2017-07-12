import UIKit
import AudioToolbox
import MediaPlayer
import AVFoundation

class TractorViewController: UIViewController {
    @IBOutlet var sliderSoundView: MPVolumeView!
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var bigWheelView: UIImageView!
    @IBOutlet var smallWheelView: UIImageView!
    @IBOutlet var cloud1View: UIImageView!
    @IBOutlet var cloud2View: UIImageView!
    @IBOutlet var cloud3View: UIImageView!
    @IBOutlet var cloud4View: UIImageView!
    @IBOutlet var cloud5View: UIImageView!
    @IBOutlet var cloud6View: UIImageView!
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
    
    let animationDuration = CFTimeInterval(10.0)
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if let filePath = Bundle.main.path(forResource: "tractor", ofType: "mp3", inDirectory: "") {
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
        
        sliderSoundView.showsRouteButton = false
        sliderSoundView.setVolumeThumbImage(UIImage(named:"volume"), for: UIControlState.normal)
        sliderSoundView.setMaximumVolumeSliderImage(UIImage(named:"min_volume"), for: UIControlState.normal)
        sliderSoundView.setMinimumVolumeSliderImage(UIImage(named:"max_volume"), for: UIControlState.normal)

    }
    
    

    override func viewDidDisappear(_ animated: Bool) {
        self.audioPlayer.stop()
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
    
    
    func enableButton() {
        self.buttonPlay.isEnabled = true
    }
    @IBAction func playSoundButton() {
        self.audioPlayer.play()
    }

    @IBAction func startAnimation() {
        self.buttonPlay.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)

        bigWheelView.transform = CGAffineTransform.identity
        smallWheelView.transform = CGAffineTransform.identity
        cloud1View.transform = CGAffineTransform.identity
        cloud1View.alpha = 1
        cloud2View.transform = CGAffineTransform.identity
        cloud2View.alpha = 1
        cloud3View.transform = CGAffineTransform.identity
        cloud3View.alpha = 1
        cloud4View.transform = CGAffineTransform.identity
        cloud4View.alpha = 1
        cloud5View.transform = CGAffineTransform.identity
        cloud5View.alpha = 1
        cloud6View.transform = CGAffineTransform.identity
        cloud6View.alpha = 1

        
        let cloud = cloud1View
        let cloud2 = cloud2View
        let cloud3 = cloud3View
        let cloud4 = cloud4View
        let cloud5 = cloud5View
        let cloud6 = cloud6View
        let cloudAnimationDuration = 3.33
        

//        let cloudPath = UIBezierPath()
//        cloudPath.move(to: CGPoint(x: 424,y: 253))
//        cloudPath.addCurve(to: CGPoint(x: 240, y: 0), controlPoint1: CGPoint(x: 490, y: 260), controlPoint2: CGPoint(x: 560, y: 0))
        let cloudPath = UIBezierPath()
        cloudPath.move(to: CGPoint(x: 424,y: 59))
        cloudPath.addCurve(to: CGPoint(x: 240, y: -193), controlPoint1: CGPoint(x: 490, y: 66), controlPoint2: CGPoint(x: 560, y: -193))
        
        let cloudScaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        cloudScaleAnimation.duration = cloudAnimationDuration
        cloudScaleAnimation.repeatCount = Float.infinity
        cloudScaleAnimation.keyTimes = [0, 0.1, 0.2, 0.3, 0.4, 1]
        cloudScaleAnimation.values = [0, 3, 6, 9, 12, 14]
        
        
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
        cloudAnimation.repeatCount = 3
        cloudAnimation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud2Animation = CAAnimationGroup()
        cloud2Animation.duration = cloudAnimationDuration
        cloud2Animation.repeatCount = 3
        cloud2Animation.beginTime = CACurrentMediaTime()+0.4
        cloud2Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud3Animation = CAAnimationGroup()
        cloud3Animation.duration = cloudAnimationDuration
        cloud3Animation.repeatCount = 3
        cloud3Animation.beginTime = CACurrentMediaTime()+1.0
        cloud3Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud4Animation = CAAnimationGroup()
        cloud4Animation.duration = cloudAnimationDuration
        cloud4Animation.repeatCount = 3
        cloud4Animation.beginTime = CACurrentMediaTime()+1.4
        cloud4Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud5Animation = CAAnimationGroup()
        cloud5Animation.duration = cloudAnimationDuration
        cloud5Animation.repeatCount = 3
        cloud5Animation.beginTime = CACurrentMediaTime()+2.1
        cloud5Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        
        let cloud6Animation = CAAnimationGroup()
        cloud6Animation.duration = cloudAnimationDuration
        cloud6Animation.repeatCount = 3
        cloud6Animation.beginTime = CACurrentMediaTime()+2.6
        cloud6Animation.animations = [cloudScaleAnimation, cloudTransparencyAnimation, cloudPathAnimation]
        

        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        
        //Clouds
                        cloud?.layer.add(cloudAnimation, forKey: "animate cloud position")
                        cloud2?.layer.add(cloud2Animation, forKey: "animate cloud position")
                        cloud3?.layer.add(cloud3Animation, forKey: "animate cloud position")
                        cloud4?.layer.add(cloud4Animation, forKey: "animate cloud position")
                        cloud5?.layer.add(cloud5Animation, forKey: "animate cloud position")
                        cloud6?.layer.add(cloud6Animation, forKey: "animate cloud position")
                        
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
