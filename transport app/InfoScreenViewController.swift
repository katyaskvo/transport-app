import UIKit
import Foundation
import Lottie

class InfoScreenViewController: UIViewController {
    @IBOutlet var iconMomBabyView: UIImageView!
    @IBOutlet weak var iconCauseEffectView: UIImageView!
    @IBOutlet weak var iconHandEyeView: UIImageView!
    @IBOutlet weak var iconFineMotorView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconSize = 120
        
        let animationMomBabyView = LOTAnimationView(name: "icon_momBaby")
        animationMomBabyView.frame = CGRect(x:0, y: 0, width: iconSize, height: iconSize)
        animationMomBabyView.loopAnimation = true
        animationMomBabyView.contentMode = .scaleAspectFill
        self.iconMomBabyView.addSubview(animationMomBabyView)
        animationMomBabyView.play()

        let animationCauseEffectView = LOTAnimationView(name: "icon_causeEffect")
        animationCauseEffectView.frame = CGRect(x:0, y: 0, width: iconSize, height: iconSize)
        animationCauseEffectView.loopAnimation = true
        animationCauseEffectView.contentMode = .scaleAspectFill
        self.iconCauseEffectView.addSubview(animationCauseEffectView)
        animationCauseEffectView.play()

        let animationFineMotorView = LOTAnimationView(name: "icon_fineMotor")
        animationFineMotorView.frame = CGRect(x:0, y: 0, width: iconSize, height: iconSize)
        animationFineMotorView.loopAnimation = true
        animationFineMotorView.contentMode = .scaleAspectFill
        self.iconHandEyeView.addSubview(animationFineMotorView)
        animationFineMotorView.play()

        let animationHandEyeView = LOTAnimationView(name: "icon_handEye")
        animationHandEyeView.frame = CGRect(x:0, y: 0, width: iconSize, height: iconSize)
        animationHandEyeView.loopAnimation = true
        animationHandEyeView.contentMode = .scaleAspectFill
        self.iconFineMotorView.addSubview(animationHandEyeView)
        animationHandEyeView.play()

    }
    
}
