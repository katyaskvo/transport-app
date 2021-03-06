import UIKit
import AudioToolbox
import MediaPlayer
import AVFoundation

class BicycleViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    @IBOutlet var button: UIButton!
    @IBOutlet var buttonBellSound: UIButton!

    @IBOutlet var frameView: UIImageView!
    @IBOutlet var frame2View: UIImageView!
    @IBOutlet var wheelBackView: UIImageView!
    @IBOutlet var wheelFrontView: UIImageView!
    @IBOutlet var chainWheelView: UIImageView!
    @IBOutlet var chain0View: UIImageView!
    
    @IBOutlet var pedalShaftView: UIImageView!
    @IBOutlet var pedalView: UIImageView!
    @IBOutlet var pedal2View: UIImageView!
    @IBOutlet var pedalShaft2View: UIImageView!
    
    @IBOutlet var sliderSoundView: MPVolumeView!
    @IBOutlet var bell00View: UIImageView!
    @IBOutlet var reflectionBackWheelView: UIImageView!
    @IBOutlet var reflectionFrontWheelView: UIImageView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var road2View: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    
    var chain0: UIImage!
    var chain1: UIImage!
    var chainImages: [UIImage]!
    var animatedChain: UIImage!
    var bellImages: [UIImage]!
    var animatedBell: UIImage!
    
    var audioPlayer: AVAudioPlayer!
    var audioPlayerBellSound: AVAudioPlayer!
    
    let animationDuration = CFTimeInterval(10.0)
    
    func volumeSliderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.audioPlayer.stop()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        func volumeSliderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds
        }
        
        chain0 = UIImage(named: "chain0")
        chain1 = UIImage(named: "chain1")

        let bell00 = UIImage(named: "bike_bell00")
        let bell01 = UIImage(named: "bike_bell01")
        let bell02 = UIImage(named: "bike_bell02")
        let bell03 = UIImage(named: "bike_bell03")
        let bell04 = UIImage(named: "bike_bell04")
        let bell05 = UIImage(named: "bike_bell05")
        let bell06 = UIImage(named: "bike_bell06")
        let bell07 = UIImage(named: "bike_bell07")
        let bell08 = UIImage(named: "bike_bell08")
        let bell09 = UIImage(named: "bike_bell09")

        chainImages = [chain0, chain1]
        bellImages = [bell00!, bell00!, bell00!, bell00!, bell01!, bell02!, bell03!, bell04!, bell05!, bell06!, bell07!, bell08!, bell09!]
        
        if let filePath = Bundle.main.path(forResource: "bike_mechanical", ofType: "mp3", inDirectory: "") {
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
        
        if let filePathBell = Bundle.main.path(forResource: "bike_bell", ofType: "mp3", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePathBell)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayerBellSound = try AVAudioPlayer(contentsOf: filePathUrl)
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
    
    func enableButton() {
        self.button.isEnabled = true
    }
    func enableBellButton() {
        self.buttonBellSound.isEnabled = true
    }
    
    @IBAction func playSoundButton() {
        self.audioPlayer.play()
    }
    
    @IBAction func playBellSoundAndAnimation() {
        self.buttonBellSound.isEnabled = false
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(enableBellButton), userInfo: nil, repeats: false)
        
        let bellViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        bellViewAnimation.calculationMode = kCAAnimationDiscrete
        bellViewAnimation.values = bellImages.map {$0.cgImage as AnyObject}
        bellViewAnimation.duration = 0.5
        bellViewAnimation.repeatCount = 2
        
        self.audioPlayerBellSound.play()

        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveLinear],
            animations: {
                
                let bellAnimation = CAAnimationGroup()
                bellAnimation.duration = 1
                bellAnimation.repeatCount = 1
                
                bellAnimation.animations = [bellViewAnimation]
                
                self.bell00View.layer.add(bellAnimation, forKey: "contents")
        }, completion: nil)
        
    }
    

    @IBAction func startAnimation() {
        self.button.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)
        
        wheelBackView.transform = CGAffineTransform.identity
        wheelFrontView.transform = CGAffineTransform.identity
        chainWheelView.transform = CGAffineTransform.identity
        pedalShaftView.transform = CGAffineTransform.identity
        pedalView.transform = CGAffineTransform.identity
        pedalShaft2View.transform = CGAffineTransform.identity
        pedal2View.transform = CGAffineTransform.identity

        reflectionBackWheelView.transform = CGAffineTransform.identity
        reflectionFrontWheelView.transform = CGAffineTransform.identity
        bell00View.transform = CGAffineTransform.identity
        road1View.transform = CGAffineTransform.identity
        road2View.transform = CGAffineTransform.identity
        

        
        self.pedalShaftView.setAnchorPoint(anchorPoint: CGPoint(x: 0.075, y: 0.075), view: self.pedalShaftView)
        self.pedalShaft2View.setAnchorPoint(anchorPoint: CGPoint(x: 0.925, y: 0.925), view: self.pedalShaft2View)
        
        let startAngle = CGFloat(M_PI * 0.26)
        let endAngle = CGFloat(M_PI)*2 + CGFloat(M_PI * 0.26)
        
        let circlePedalPath = UIBezierPath(arcCenter: CGPoint(x: 339,y: 267), radius: 49, startAngle:startAngle , endAngle: endAngle, clockwise: true)
        let pedalAnimation = CAKeyframeAnimation(keyPath: "position")
        pedalAnimation.calculationMode = kCAAnimationPaced
        pedalAnimation.path = circlePedalPath.cgPath
        pedalAnimation.repeatCount = 10
        pedalAnimation.duration = 1.0
        
        let circlePedalPath2 = UIBezierPath(arcCenter: CGPoint(x: 339,y: 267), radius: 49, startAngle: CGFloat(M_PI * 0.74 + M_PI/2), endAngle:CGFloat(M_PI)*2 + CGFloat(M_PI * 0.74 + M_PI/2), clockwise: true)
        let pedalAnimation2 = CAKeyframeAnimation(keyPath: "position")
        pedalAnimation2.calculationMode = kCAAnimationPaced
        pedalAnimation2.path = circlePedalPath2.cgPath
        pedalAnimation2.repeatCount = 10
        pedalAnimation2.duration = 1.0

        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveLinear],
            animations: {
                
                self.chain0View.animationImages = self.chainImages
                self.chain0View.animationDuration = 0.1
                self.chain0View.animationRepeatCount = 100
                self.chain0View.startAnimating()
                
                //Shake
                self.frameView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.15, 0.4, 0.65, 1], animatedImageView: self.frameView, duration: 0.75, animationDuration: self.animationDuration)
                self.frame2View.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.frame2View, duration: 0.75, animationDuration: self.animationDuration)
                self.chain0View.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.chain0View, duration: 0.75, animationDuration: self.animationDuration)
                self.chainWheelView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.chainWheelView, duration: 0.5, animationDuration: self.animationDuration)
                self.pedalView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.pedalView, duration: 0.75, animationDuration: self.animationDuration)
                self.pedalShaftView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.pedalShaftView, duration: 0.5, animationDuration: self.animationDuration)
                self.pedal2View.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.pedal2View, duration: 0.75, animationDuration: self.animationDuration)
                self.pedalShaft2View.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.pedalShaft2View, duration: 0.5, animationDuration: self.animationDuration)
                
                self.bell00View.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.2, 0.45, 0.7, 1], animatedImageView: self.bell00View, duration: 0.75, animationDuration: self.animationDuration)

                
                self.wheelBackView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.wheelBackView, duration: 0.75, animationDuration: self.animationDuration)
                self.wheelFrontView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.wheelFrontView, duration: 0.75, animationDuration: self.animationDuration)
                self.reflectionBackWheelView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.75, animationDuration: self.animationDuration)
                self.reflectionFrontWheelView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.75, animationDuration: self.animationDuration)

                self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1.5, animationDuration: self.animationDuration)
                
                UIView.setAnimationDuration(0.77)
                UIView.setAnimationRepeatCount(13)
                self.wheelBackView.rotate360Degrees(duration: 0.5, repeatCount: 20)
                self.wheelFrontView.rotate360Degrees(duration: 0.5, repeatCount: 20)
                
                self.chainWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                
                
                self.pedalShaftView.rotate360Degrees(duration: 1, repeatCount: 10)
                self.pedalView.layer.add(pedalAnimation, forKey: nil)
                
                self.pedalShaft2View.rotate360Degrees(duration: 1, repeatCount: 10)
                self.pedal2View.layer.add(pedalAnimation2, forKey: nil)
                
                
    //Wheel Reflection
                self.reflectionBackWheelView.animateWheelReflection(values: [M_PI * 0.02, M_PI * (-0.025), M_PI * 0.005, M_PI * (-0.025), M_PI * 0.01 ], keyTimes: [0, 0.25, 0.45, 0.65, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.83, animationDuration: self.animationDuration)
                self.reflectionFrontWheelView.animateWheelReflection(values: [M_PI * 0.02, M_PI * (-0.025), M_PI * 0.005, M_PI * (-0.025), M_PI * 0.01 ], keyTimes: [0, 0.25, 0.45, 0.65, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.83, animationDuration: self.animationDuration)

                
               
        }, completion: nil)
//        }
        
    }

}

