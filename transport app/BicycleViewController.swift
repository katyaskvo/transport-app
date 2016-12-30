

//
//  DataViewController.swift
//  transport app
//
//  Created by Ekaterina Zdorov on 7/13/16.
//  Copyright © 2016 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class BicycleViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    @IBOutlet var button: UIButton!

    @IBOutlet var wheelBackView: UIImageView!
    @IBOutlet var wheelFrontView: UIImageView!
    @IBOutlet var chainWheelView: UIImageView!
    @IBOutlet var chain0View: UIImageView!
    
    @IBOutlet var pedalShaftView: UIImageView!
    @IBOutlet var pedalView: UIImageView!
    @IBOutlet var pedal2View: UIImageView!
    @IBOutlet var pedalShaft2View: UIImageView!
    
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
    
    let animationDuration = CFTimeInterval(10.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        bellImages = [bell00!, bell01!, bell02!, bell03!, bell04!, bell05!, bell06!, bell07!, bell08!, bell09!]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func enableButton() {
        self.button.isEnabled = true
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
        
        let bellViewAnimation = CAKeyframeAnimation(keyPath: "contents")
        bellViewAnimation.calculationMode = kCAAnimationDiscrete
        bellViewAnimation.values = bellImages.map {$0.cgImage as AnyObject}
        bellViewAnimation.duration = 0.25
        bellViewAnimation.repeatCount = 2

        
        let pedalShaftRotationPoint = CGPoint(x: 0.077, y: 0.071)
        pedalShaftView.layer.anchorPoint = pedalShaftRotationPoint
        pedalShaftView.layer.position = CGPoint(x: 500.5, y: 459.5)
        
        let pedalShaft2RotationPoint = CGPoint(x: 0.923, y: 0.929)
        pedalShaft2View.layer.anchorPoint = pedalShaft2RotationPoint
        pedalShaft2View.layer.position = CGPoint(x: 500.5, y: 459.5)

        
        
        let circlePedalPath = UIBezierPath(arcCenter: CGPoint(x: 500.5,y: 459.5), radius: 49, startAngle: CGFloat(M_PI * 0.26), endAngle:CGFloat(M_PI)*2 + CGFloat(M_PI * 0.26), clockwise: true)
        let pedalAnimation = CAKeyframeAnimation(keyPath: "position")
        pedalAnimation.path = circlePedalPath.cgPath
        pedalAnimation.repeatCount = 10
        pedalAnimation.duration = 1.0
        
        let circlePedalPath2 = UIBezierPath(arcCenter: CGPoint(x: 500.5,y: 459.5), radius: 49, startAngle: CGFloat(M_PI * 0.74 + M_PI/2), endAngle:CGFloat(M_PI)*2 + CGFloat(M_PI * 0.74 + M_PI/2), clockwise: true)
        let pedalAnimation2 = CAKeyframeAnimation(keyPath: "position")
        pedalAnimation2.path = circlePedalPath2.cgPath
        pedalAnimation2.repeatCount = 10
        pedalAnimation2.duration = 1.0
        
//        print(self.chain0View.isAnimating)
//        if self.chain0View.isAnimating == true {
//            self.chain0View.layer.removeAllAnimations()
//            self.wheelBackView.layer.removeAllAnimations()
//            self.wheelFrontView.layer.removeAllAnimations()
//            self.chainWheelView.layer.removeAllAnimations()
//            self.chain0View.layer.removeAllAnimations()
//
//            self.pedalShaftView.layer.removeAllAnimations()
//            self.pedalView.layer.removeAllAnimations()
//            self.pedal2View.layer.removeAllAnimations()
//            self.pedalShaft2View.layer.removeAllAnimations()
//
//            self.bell00View.layer.removeAllAnimations()
//            self.reflectionBackWheelView.layer.removeAllAnimations()
//            self.reflectionFrontWheelView.layer.removeAllAnimations()
//            self.road1View.layer.removeAllAnimations()
//            self.road2View.layer.removeAllAnimations()
//        } else {

        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveLinear],
            animations: {
                
                self.chain0View.animationImages = self.chainImages
                self.chain0View.animationDuration = 0.1
                self.chain0View.animationRepeatCount = 100
                self.chain0View.startAnimating()
                
                let bellAnimation = CAAnimationGroup()
                bellAnimation.duration = 2.5
                bellAnimation.repeatCount = 4
                
                bellAnimation.animations = [bellViewAnimation]
                
                

                self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1.5, animationDuration: self.animationDuration)
                
                UIView.setAnimationDuration(0.77)
                UIView.setAnimationRepeatCount(13)
                self.wheelBackView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                self.wheelFrontView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                
                self.chainWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                
                
                self.pedalShaftView.rotate360Degrees(duration: 1, repeatCount: 10)
                self.pedalView.layer.add(pedalAnimation, forKey: nil)
                
                self.pedalShaft2View.rotate360Degrees(duration: 1, repeatCount: 10)
                self.pedal2View.layer.add(pedalAnimation2, forKey: nil)
                
                
    //Wheel Reflection
                self.reflectionBackWheelView.animateWheelReflection(values: [M_PI * 0.02, M_PI * (-0.025), M_PI * 0.005, M_PI * (-0.025), M_PI * 0.01 ], keyTimes: [0, 0.25, 0.45, 0.65, 1], animatedImageView: self.reflectionBackWheelView, duration: 0.83, animationDuration: self.animationDuration)
                self.reflectionFrontWheelView.animateWheelReflection(values: [M_PI * 0.02, M_PI * (-0.025), M_PI * 0.005, M_PI * (-0.025), M_PI * 0.01 ], keyTimes: [0, 0.25, 0.45, 0.65, 1], animatedImageView: self.reflectionFrontWheelView, duration: 0.83, animationDuration: self.animationDuration)

                
                self.bell00View.layer.add(bellAnimation, forKey: "contents")
        }, completion: nil)
//        }
        
    }

}

