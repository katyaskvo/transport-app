import UIKit
import AudioToolbox

class BeetleViewController: UIViewController {
    
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var bodyView: UIImageView!
    @IBOutlet var backWheelView: UIImageView!
    @IBOutlet var backWheelReflectionView: UIImageView!
    @IBOutlet var frontWheelView: UIImageView!
    @IBOutlet var frontWheelReflectionView: UIImageView!
    @IBOutlet var windowReflectionView: UIImageView!
    @IBOutlet var pipeView: UIImageView!
    @IBOutlet var roadBoxView: UIView!
    @IBOutlet weak var road1View: UIImageView!
    @IBOutlet weak var road2View: UIImageView!
    
    let animationDuration = CFTimeInterval(10.0)
    
    func enableButton() {
        self.buttonPlay.isEnabled = true
    }
    var soundId : SystemSoundID = 0
    
    func playSound() {
        let soundUrl = Bundle.main.url(forResource: "beetle", withExtension: "mp3")
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
        AudioServicesPlaySystemSound(soundId)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if soundId != 0 {
            AudioServicesDisposeSystemSoundID(soundId)
        }
    }
    
    @IBAction func startAnimation() {
        self.buttonPlay.isEnabled = false
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(enableButton), userInfo: nil, repeats: false)
        playSound()
        
        UIView.animate(withDuration: 4,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        
                        //Shake
                        self.bodyView.shake(values: [0.75, -0.75, 0.75, -0.75, 0.75], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.bodyView, duration: 0.75, animationDuration: self.animationDuration)
                        self.windowReflectionView.shake(values: [0.25, -0.25, 0.25, -0.25, 0.25], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.windowReflectionView, duration: 0.75, animationDuration: self.animationDuration)
                        self.pipeView.shake(values: [0.5, -0.5, 0.5, -0.5, 0.5], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.pipeView, duration: 0.75, animationDuration: self.animationDuration)
                        
                        //Wheels
                        self.backWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.frontWheelView.rotate360Degrees(duration: 1, repeatCount: 10)
                        self.backWheelReflectionView.animateWheelReflection(values: [0, M_PI * 0.02, 0, M_PI * (-0.03), 0 ], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.backWheelReflectionView, duration: 0.5, animationDuration: self.animationDuration)
                        self.frontWheelReflectionView.animateWheelReflection(values: [0, M_PI * 0.02, 0, M_PI * (-0.03), 0 ], keyTimes: [0, 0.25, 0.5, 0.75, 1], animatedImageView: self.frontWheelReflectionView, duration: 0.5, animationDuration: self.animationDuration)
                        
                        //Road
                        self.roadBoxView.moveTheRoad(road1View: self.road1View, road2View: self.road2View, duration: 1, animationDuration: self.animationDuration)
                        
        }, completion: nil)
    }
}
