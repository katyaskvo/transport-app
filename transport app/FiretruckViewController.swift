import UIKit
import AudioToolbox
import MediaPlayer
import AVFoundation

class FiretruckViewController: UIViewController {
    @IBOutlet var sliderSoundView: MPVolumeView!
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var firetruckBodyView: UIImageView!
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    @IBOutlet var road1View: UIImageView!
    @IBOutlet var road2View: UIImageView!
    
    @IBOutlet var firetruckHoldersView: UIImageView!
    @IBOutlet var light1View: UIImageView!
    @IBOutlet var light1OffView: UIImageView!
    @IBOutlet var light2View: UIImageView!
    @IBOutlet var light2OffView: UIImageView!
    @IBOutlet var light3View: UIImageView!
    @IBOutlet var light3OffView: UIImageView!
    @IBOutlet var light4View: UIImageView!
    @IBOutlet var light4OffView: UIImageView!
    @IBOutlet var light5View: UIImageView!
    @IBOutlet var light5OffView: UIImageView!
    @IBOutlet var light6View: UIImageView!
    @IBOutlet var light6OffView: UIImageView!
    @IBOutlet var lightFrontRedView: UIImageView!
    @IBOutlet var lightFrontWhiteView: UIImageView!
    @IBOutlet var lightOrangeView: UIImageView!
    @IBOutlet var syrenView: UIImageView!
    @IBOutlet var syrenRoofView: UIImageView!
    @IBOutlet var syrenRoof2View: UIImageView!
    
    @IBOutlet var ladderView: UIImageView!
    @IBOutlet var garpunView: UIImageView!
    @IBOutlet var axeView: UIImageView!
    @IBOutlet var windowReflectionView: UIImageView!
    @IBOutlet var chainView: UIImageView!
    
    @IBOutlet var reflectionBackWheelView: UIImageView!
    @IBOutlet var reflectionFrontWheelView: UIImageView!
    
    let animationDuration = CFTimeInterval(10.0)
    
    var light1Images: [UIImage]!
    var animatedLight1: UIImage!
    var light2Images: [UIImage]!
    var animatedLight2: UIImage!
    var light3Images: [UIImage]!
    var animatedLight3: UIImage!
    var light4Images: [UIImage]!
    var animatedLight4: UIImage!
    var light5Images: [UIImage]!
    var animatedLight5: UIImage!
    var light6Images: [UIImage]!
    var animatedLight6: UIImage!
    
    var lightFrontRedImages: [UIImage]!
    var animatedFrontRed: UIImage!
    var lightFrontWhite01Images: [UIImage]!
    var lightFrontWhite02Images: [UIImage]!
    var animatedFrontWhite: UIImage!
    var lightOrangeImages: [UIImage]!

    
    var lightRoofImages: [UIImage]!
    var lightRoof2Images: [UIImage]!
    var animatedLightRoof: UIImage!
    var animatedLightRoof2: UIImage!
    
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidDisappear(_ animated: Bool) {
        self.audioPlayer.stop()
    }
    

    func animateSyren2() {
        let lightTwoViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightTwoViewAnimation.calculationMode = kCAAnimationDiscrete
        
        UIView.animate(withDuration: 1,
                       delay: 5,
                       options: [.curveLinear],
                       animations: {
                        lightTwoViewAnimation.values = self.light2Images.map {$0.cgImage as AnyObject}
                        lightTwoViewAnimation.duration = 1
                        lightTwoViewAnimation.repeatCount = 1
                        
                        let SyrenTwoAnimation = CAAnimationGroup()
                        SyrenTwoAnimation.duration = 1
                        SyrenTwoAnimation.repeatCount = 10
                        
                        SyrenTwoAnimation.animations = [lightTwoViewAnimation]
                        self.light2View.layer.add(SyrenTwoAnimation, forKey: "contents")
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let light1_00 = UIImage(named: "lightOne00")
        let light1_01 = UIImage(named: "lightOne01")
        let light1_02 = UIImage(named: "lightOne02")
        light1Images = [light1_00!, light1_00!,light1_00!, light1_00!, light1_00!, light1_00!, light1_00!, light1_00!, light1_01!, light1_02!, light1_01!, light1_02!, light1_01!, light1_02!, light1_01!, light1_00!]
    
        let light2_00 = UIImage(named: "lightTwo00")
        let light2_01 = UIImage(named: "lightTwo01")
        let light2_02 = UIImage(named: "lightTwo02")
        light2Images = [light2_00!,light2_00!,light2_00!,light2_00!,light2_00!,light2_00!,light2_00!,light2_00!, light2_01!, light2_02!, light2_01!, light2_02!, light2_01!, light2_02!, light2_01!, light2_00!]
    
        let light3_00 = UIImage(named: "lightThree00")
        let light3_01 = UIImage(named: "lightThree01")
        let light3_02 = UIImage(named: "lightThree02")
        light3Images = [light3_00!, light3_01!, light3_02!, light3_01!, light3_02!, light3_01!, light3_02!, light3_01!, light3_00!]
    
        let light4_00 = UIImage(named: "lightFour00")
        let light4_01 = UIImage(named: "lightFour01")
        let light4_02 = UIImage(named: "lightFour02")
        light4Images = [light4_00!, light4_01!, light4_02!, light4_01!, light4_02!, light4_01!, light4_02!, light4_01!, light4_00!]
    
        let light5_00 = UIImage(named: "lightFive00")
        let light5_01 = UIImage(named: "lightFive01")
        let light5_02 = UIImage(named: "lightFive02")
        light5Images = [light5_00!,light5_00!,light5_00!,light5_00!,light5_00!,light5_00!,light5_00!,light5_00!, light5_01!, light5_02!, light5_01!, light5_02!, light5_01!, light5_02!, light5_01!, light5_00!]
    

        light6Images = [light3_00!, light3_00!,light3_00!, light3_00!, light3_00!,light3_00!, light3_00!, light3_00!, light3_01!, light3_02!, light3_01!, light3_02!, light3_01!, light3_02!, light3_01!, light3_00!]
    
        let light_front_00 = UIImage(named: "front00")
        let light_frontRed_01 = UIImage(named: "frontRed01")
        let light_frontRed_02 = UIImage(named: "frontRed02")
        lightFrontRedImages = [light_front_00!, light_front_00!,light_front_00!,light_front_00!,light_front_00!,light_front_00!,light_front_00!,light_front_00!, light_frontRed_01!, light_frontRed_02!, light_frontRed_01!, light_frontRed_02!, light_frontRed_01!, light_frontRed_02!, light_frontRed_01!, light_front_00!]
    

        let light_frontWhite_01 = UIImage(named: "headlights01")
        let light_frontWhite_02 = UIImage(named: "headlights02")
        lightFrontWhite01Images = [light_front_00!, light_frontWhite_02!, light_frontWhite_01!, light_frontWhite_02!, light_frontWhite_01!, light_frontWhite_02!, light_frontWhite_01!, light_frontWhite_02!, light_frontWhite_01!]
        lightFrontWhite02Images = [light_frontWhite_02!, light_frontWhite_01!, light_frontWhite_02!, light_frontWhite_01!, light_frontWhite_02!, light_frontWhite_02!, light_frontWhite_01!, light_frontWhite_02!, light_frontWhite_02!]
    
        let light_orange_01 = UIImage(named: "lightOrange01")
        let light_orange_02 = UIImage(named: "lightOrange02")
        lightOrangeImages = [light_orange_01!, light_orange_02!, light_orange_01!, light_orange_02!, light_orange_01!, light_orange_01!, light_orange_02!, light_orange_02!, light_orange_01!]

    
        let lightRoof_000 = UIImage(named: "roofLight000")
        let lightRoof_01 = UIImage(named: "roofLight01")
        let lightRoof_02 = UIImage(named: "roofLight02")
        lightRoofImages = [lightRoof_01!, lightRoof_02!, lightRoof_01!, lightRoof_000!, lightRoof_000!, lightRoof_000! ]

        lightRoof2Images = [lightRoof_000!, lightRoof_000!, lightRoof_000!, lightRoof_01!, lightRoof_02!, lightRoof_01! ]
        
        if let filePath = Bundle.main.path(forResource: "firetruck", ofType: "mp3", inDirectory: "") {
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
    
    func enableButton() {
        self.buttonPlay.isEnabled = true
    }
    
    @IBAction func playSoundButton() {
        self.audioPlayer.play()
    }
    
    @IBAction func startAnimation() {
        self.buttonPlay.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)
        
        frontWheelView.transform = CGAffineTransform.identity
        backWheelView.transform = CGAffineTransform.identity
        
        
        reflectionBackWheelView.transform = CGAffineTransform.identity
        reflectionFrontWheelView.transform = CGAffineTransform.identity
        
        road1View.transform = CGAffineTransform.identity
        road2View.transform = CGAffineTransform.identity
        
        let lightOneViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightOneViewAnimation.calculationMode = kCAAnimationDiscrete
        lightOneViewAnimation.values = light1Images.map {$0.cgImage as AnyObject}
        lightOneViewAnimation.duration = 1
        lightOneViewAnimation.repeatCount = 1
       
        let lightThreeViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightThreeViewAnimation.calculationMode = kCAAnimationDiscrete
        lightThreeViewAnimation.values = light3Images.map {$0.cgImage as AnyObject}
        lightThreeViewAnimation.duration = 0.5
        lightThreeViewAnimation.repeatCount = 1
        
        let lightFourViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightFourViewAnimation.calculationMode = kCAAnimationDiscrete
        lightFourViewAnimation.values = light4Images.map {$0.cgImage as AnyObject}
        lightFourViewAnimation.duration = 0.5
        lightFourViewAnimation.repeatCount = 1
        
        let lightFiveViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightFiveViewAnimation.calculationMode = kCAAnimationDiscrete
        lightFiveViewAnimation.values = light5Images.map {$0.cgImage as AnyObject}
        lightFiveViewAnimation.duration = 1
        lightFiveViewAnimation.repeatCount = 1

        let lightSixViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightSixViewAnimation.calculationMode = kCAAnimationDiscrete
        lightSixViewAnimation.values = light6Images.map {$0.cgImage as AnyObject}
        lightSixViewAnimation.duration = 1
        lightSixViewAnimation.repeatCount = 1
        
        
        let lightFrontRedViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightFrontRedViewAnimation.calculationMode = kCAAnimationDiscrete
        lightFrontRedViewAnimation.values = lightFrontRedImages.map {$0.cgImage as AnyObject}
        lightFrontRedViewAnimation.duration = 1
        lightFrontRedViewAnimation.repeatCount = 1

        let lightFrontWhiteView01Animation = CAKeyframeAnimation(keyPath: "contents")
        lightFrontWhiteView01Animation.calculationMode = kCAAnimationDiscrete
        lightFrontWhiteView01Animation.values = lightFrontWhite01Images.map {$0.cgImage as AnyObject}
        lightFrontWhiteView01Animation.duration = 1
        lightFrontWhiteView01Animation.repeatCount = 1
        
        let lightFrontWhiteView02Animation = CAKeyframeAnimation(keyPath: "contents")
        lightFrontWhiteView02Animation.calculationMode = kCAAnimationDiscrete
        lightFrontWhiteView02Animation.values = lightFrontWhite02Images.map {$0.cgImage as AnyObject}
        lightFrontWhiteView02Animation.duration = 0.5
        lightFrontWhiteView02Animation.repeatCount = 20

        let lightOrangeViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightOrangeViewAnimation.calculationMode = kCAAnimationDiscrete
        lightOrangeViewAnimation.values = lightOrangeImages.map {$0.cgImage as AnyObject}
        lightOrangeViewAnimation.duration = 1
        lightOrangeViewAnimation.repeatCount = 10
        
        let lightRoofViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightRoofViewAnimation.calculationMode = kCAAnimationDiscrete
        lightRoofViewAnimation.values = lightRoofImages.map {$0.cgImage as AnyObject}
        lightRoofViewAnimation.duration = 0.4
        lightRoofViewAnimation.repeatCount = 1

        let lightRoof2ViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        lightRoof2ViewAnimation.calculationMode = kCAAnimationDiscrete
        lightRoof2ViewAnimation.values = lightRoof2Images.map {$0.cgImage as AnyObject}
        lightRoof2ViewAnimation.duration = 0.4
        lightRoof2ViewAnimation.repeatCount = 1
        
        self.chainView.setAnchorPoint(anchorPoint: CGPoint(x: 0.5, y: 0), view: self.chainView)

        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        UIView.setAnimationRepeatCount(15)

                        UIView.setAnimationDuration(0.4)
                        UIView.setAnimationRepeatCount(30)
                        self.frontWheelView.rotate360Degrees(duration: 0.8, repeatCount: 12.5)
                        self.backWheelView.rotate360Degrees(duration: 0.8, repeatCount: 12.5)
                        self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1, animationDuration: self.animationDuration)
                        
                        //Wheel Reflection
                        self.reflectionBackWheelView.animateWheelReflection(values: [M_PI * 0.015, M_PI * (-0.02), M_PI * 0.015 ], keyTimes: [0, 0.5, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.3, animationDuration: self.animationDuration)
                        self.reflectionFrontWheelView.animateWheelReflection(values: [M_PI * 0.015, M_PI * (-0.02), M_PI * 0.015 ], keyTimes: [0, 0.5, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.3, animationDuration: self.animationDuration)
                        
                        //Shake
                        self.firetruckBodyView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.firetruckBodyView, duration: 0.7, animationDuration: self.animationDuration)
                        
                        self.chainView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.chainView, duration: 0.7, animationDuration: self.animationDuration)
                    
                        self.firetruckHoldersView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.firetruckHoldersView, duration: 0.7, animationDuration: self.animationDuration)
                        
                        self.lightFrontRedView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.lightFrontRedView, duration: 0.7, animationDuration: self.animationDuration)
                        self.lightFrontWhiteView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.lightFrontWhiteView, duration: 0.7, animationDuration: self.animationDuration)
                        self.lightOrangeView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.lightOrangeView, duration: 0.7, animationDuration: self.animationDuration)
                        self.syrenRoofView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.syrenRoofView, duration: 0.7, animationDuration: self.animationDuration)
                        self.syrenRoof2View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.syrenRoof2View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light6View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light6View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light5View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light5View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light4View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light4View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light3View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light3View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light2View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light2View, duration: 0.7, animationDuration: self.animationDuration)
                        self.light1View.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light1View, duration: 0.7, animationDuration: self.animationDuration)
                        self.syrenView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.syrenView, duration: 0.7, animationDuration: self.animationDuration)
                        self.windowReflectionView.shake(values: [0, -1, 0, -1, 0], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.windowReflectionView, duration: 0.7, animationDuration: self.animationDuration)
                     
                        self.light6OffView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light6OffView, duration: 0.7, animationDuration: self.animationDuration)
                        self.light5OffView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light5OffView, duration: 0.7, animationDuration: self.animationDuration)
                        self.light4OffView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light4OffView, duration: 0.7, animationDuration: self.animationDuration)
                        self.light3OffView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light3OffView, duration: 0.7, animationDuration: self.animationDuration)
                        self.light2OffView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light2OffView, duration: 0.7, animationDuration: self.animationDuration)
                        self.light1OffView.shake(values: [1, -1, 1, -1, 1], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.light1OffView, duration: 0.7, animationDuration: self.animationDuration)

                        
                        //parts shake
                        self.ladderView.shake(values: [0, 0.1, -0.3, 0, -0.1, 0], keyTimes: [0, 0.1, 0.35, 0.6, 0.85, 1], animatedImageView: self.ladderView, duration: 0.75, animationDuration: self.animationDuration)
                        self.garpunView.shake(values: [0, 1.2, -0.5, 0.5, -0.5, 0], keyTimes: [0, 0.1, 0.35, 0.6, 0.85, 1], animatedImageView: self.garpunView, duration: 0.75, animationDuration: self.animationDuration)
                        self.axeView.shake(values: [0, 0.5, -1.2, 1, -0.5, 0], keyTimes: [0, 0.1, 0.35, 0.6, 0.85, 1], animatedImageView: self.axeView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        
                        //Syren Shine1
                        let SyrenOneAnimation = CAAnimationGroup()
                        SyrenOneAnimation.duration = 1
                        SyrenOneAnimation.repeatCount = 10
                        
                        SyrenOneAnimation.animations = [lightOneViewAnimation]
                        self.light1View.layer.add(SyrenOneAnimation, forKey: "contents")
                        
                        //Syren Shine3
                        let SyrenThreeAnimation = CAAnimationGroup()
                        SyrenThreeAnimation.duration = 1
                        SyrenThreeAnimation.repeatCount = 10
                        
                        SyrenThreeAnimation.animations = [lightThreeViewAnimation]
                        self.light3View.layer.add(SyrenThreeAnimation, forKey: "contents")
                        
                        self.animateSyren2()
                        
                        
                        //Syren Shine4
                        let SyrenFourAnimation = CAAnimationGroup()
                        SyrenFourAnimation.duration = 1
                        SyrenFourAnimation.repeatCount = 10
                        
                        SyrenFourAnimation.animations = [lightFourViewAnimation]
                        self.light4View.layer.add(SyrenFourAnimation, forKey: "contents")

                        //Syren Shine5
                        let SyrenFiveAnimation = CAAnimationGroup()
                        SyrenFiveAnimation.duration = 1
                        SyrenFiveAnimation.repeatCount = 10
                        
                        SyrenFiveAnimation.animations = [lightFiveViewAnimation]
                        self.light5View.layer.add(SyrenFiveAnimation, forKey: "contents")
                        
                        //Syren Shine6
                        let SyrenSixAnimation = CAAnimationGroup()
                        SyrenSixAnimation.duration = 1
                        SyrenSixAnimation.repeatCount = 10
                        
                        SyrenSixAnimation.animations = [lightSixViewAnimation]
                        self.light6View.layer.add(SyrenSixAnimation, forKey: "contents")

                        //Syren Front Red
                        let SyrenFrontRedAnimation = CAAnimationGroup()
                        SyrenFrontRedAnimation.duration = 1
                        SyrenFrontRedAnimation.repeatCount = 10
                        
                        SyrenFrontRedAnimation.animations = [lightFrontRedViewAnimation]
                        self.lightFrontRedView.layer.add(SyrenFrontRedAnimation, forKey: "contents")
                        
                        //Syren Front White
                        let SyrenFrontWhiteAnimation = CAAnimationGroup()
                        SyrenFrontWhiteAnimation.duration = 10
                        SyrenFrontWhiteAnimation.repeatCount = 1
                        
                        SyrenFrontWhiteAnimation.animations = [lightFrontWhiteView01Animation, lightFrontWhiteView02Animation]
                        self.lightFrontWhiteView.layer.add(SyrenFrontWhiteAnimation, forKey: "contents")
                        self.lightFrontWhiteView.fadeInanOut(values: [0, 1, 1, 0], animatedImageView: self.lightFrontWhiteView, keytimes: [0, 0.02, 0.98, 1], duration: 10, animationDuration: self.animationDuration)
                        
                        //Orange Light
                        self.lightOrangeView.layer.add(lightOrangeViewAnimation, forKey: "contents")
                        
                        //Syren Roof
                        let SyrenRoofAnimation = CAAnimationGroup()
                        SyrenRoofAnimation.duration = 0.4
                        SyrenRoofAnimation.repeatCount = 25
                        
                        SyrenRoofAnimation.animations = [lightRoofViewAnimation]
                        self.syrenRoofView.layer.add(SyrenRoofAnimation, forKey: "contents")
                        
                        let SyrenRoof2Animation = CAAnimationGroup()
                        SyrenRoof2Animation.duration = 0.4
                        SyrenRoof2Animation.repeatCount = 25
                        
                        SyrenRoof2Animation.animations = [lightRoof2ViewAnimation]
                        self.syrenRoof2View.layer.add(SyrenRoof2Animation, forKey: "contents")
                        
                        self.chainView.animateWheelReflection(values: [M_PI * 0.015, M_PI * (-0.02), M_PI * 0.015 ], keyTimes: [0, 0.5, 1], animatedImageView: self.chainView, duration: 0.5, animationDuration: self.animationDuration)
                        
        }, completion: nil)
    }
}
