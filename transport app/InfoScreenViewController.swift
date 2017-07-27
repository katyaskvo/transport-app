import UIKit
import Foundation
import Lottie

class InfoScreenViewController: UIViewController {
    @IBOutlet var iconMomBabyView: UIImageView!
    @IBOutlet var iconCauseEffectView: UIImageView!
    @IBOutlet var iconHandEyeView: UIImageView!
    @IBOutlet var iconFineMotorView: UIImageView!
    @IBOutlet var iconAge: UIImageView!
    @IBOutlet var iconBook: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconSize = iconMomBabyView.frame.width
        
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

        let animationAgeView = LOTAnimationView(name: "icon_age")
        animationAgeView.frame = CGRect(x:0, y: 0, width: iconSize, height: iconSize)
        animationAgeView.loopAnimation = true
        animationAgeView.contentMode = .scaleAspectFill
        self.iconAge.addSubview(animationAgeView)
        animationAgeView.play()

        let animationBookView = LOTAnimationView(name: "icon_book")
        animationBookView.frame = CGRect(x:0, y: 0, width: iconSize, height: iconSize)
        animationBookView.loopAnimation = true
        animationBookView.contentMode = .scaleAspectFill
        self.iconBook.addSubview(animationBookView)
        animationBookView.play()
        

    }
    
}
