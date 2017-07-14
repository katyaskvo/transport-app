import UIKit
import Foundation
import Lottie

class InfoScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func animateIcon(_ sender: Any) {

        let iconSize = 150
        
        let animationCauseEffectView = LOTAnimationView(name: "icon_causeEffect")
        animationCauseEffectView.frame = CGRect(x:350, y: 300, width: iconSize, height: iconSize)

        animationCauseEffectView.contentMode = .scaleAspectFill
        
        let animationFineMotorView = LOTAnimationView(name: "icon_fineMotor")
        animationFineMotorView.frame = CGRect(x:600, y: 300, width: iconSize, height: iconSize)
        animationFineMotorView.contentMode = .scaleAspectFill

        let animationHandEyeView = LOTAnimationView(name: "icon_handEye")
        animationHandEyeView.frame = CGRect(x:350, y: 600, width: iconSize, height: iconSize)
        animationHandEyeView.contentMode = .scaleAspectFill

        let animationMomBabyView = LOTAnimationView(name: "icon_momBaby")
        animationMomBabyView.frame = CGRect(x:600, y: 600, width: iconSize, height: iconSize)
        animationMomBabyView.contentMode = .scaleAspectFill

        
        self.view.addSubview(animationCauseEffectView)
        self.view.addSubview(animationFineMotorView)
        self.view.addSubview(animationHandEyeView)
        self.view.addSubview(animationMomBabyView)

        animationCauseEffectView.play()
        animationFineMotorView.play()
        animationHandEyeView.play()
        animationMomBabyView.play()
    }
}
