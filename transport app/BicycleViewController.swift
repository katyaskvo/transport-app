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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.dataLabel!.text = dataObject
    }
    
    @IBOutlet var wheelBackView: UIImageView!
    @IBOutlet var wheelFrontView: UIImageView!
    @IBOutlet var chainWheelView: UIImageView!
    @IBOutlet var chain0View: UIImageView!
    @IBOutlet var chain1View: UIImageView!
    
    @IBAction func startAnimation() {
        wheelBackView.transform = CGAffineTransform.identity
        wheelFrontView.transform = CGAffineTransform.identity
        chainWheelView.transform = CGAffineTransform.identity
        chain0View.transform = CGAffineTransform.identity
        chain1View.transform = CGAffineTransform.identity
        
        self.chain0View.alpha = 0
        self.chain1View.alpha = 1
        
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveLinear],
            animations: {
                UIView.setAnimationDuration(0.2)
                UIView.setAnimationRepeatCount(50)
                self.chain1View.alpha = 0
                self.chain0View.alpha = 1
                
                UIView.setAnimationDuration(0.77)
                UIView.setAnimationRepeatCount(13)
                self.wheelBackView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                self.wheelFrontView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                UIView.setAnimationDuration(0.33)
                UIView.setAnimationRepeatCount(30)
                self.chainWheelView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI * 2/5))
        }, completion: nil)
    }


}

