//
//  ViewController.swift
//  ESPopupDialog
//
//  Created by Evan Su on 09/21/2016.
//  Copyright (c) 2016 Evan Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickAction(sender: UIButton) {
        let resetPasswordPopup=ESResetPasswordDialog(nibName: "ESResetPasswordDialog", bundle: nil, popupWidth: 315.0, popupHeight: 276.0)
        self.presentViewController(resetPasswordPopup, animated: true) {
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

