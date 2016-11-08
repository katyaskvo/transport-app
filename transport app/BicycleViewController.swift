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
    
    @IBAction func startAnimation() {
        wheelBackView.transform = CGAffineTransform.identity
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [.curveLinear],
            animations: {
                UIView.setAnimationRepeatCount(10)
                self.wheelBackView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        }, completion: nil)
    }


}

