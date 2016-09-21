//
//  ESResetPasswordDialog.swift
//  SmartApartments
//
//  Created by Mrudul Vasavada on 31/08/2016.
//  Copyright © 2016 BPM. All rights reserved.
//

import UIKit
import ESPopupDialog

class ESResetPasswordDialog: ESPopupDialog {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeAction(sender: UIButton) {
        emailTextField.resignFirstResponder()
        self.dismiss()
    }
    
    @IBAction func resetAction(sender: UIButton) {
        emailTextField.resignFirstResponder()

        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
