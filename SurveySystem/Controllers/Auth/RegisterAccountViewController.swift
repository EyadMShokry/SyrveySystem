//
//  RegisterAccountViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/4/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit
import TextFieldEffects
import SCLAlertView

class RegisterAccountViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameTextField: HoshiTextField!
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickRegisterButton(_ sender: UIButton) {
        if(emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || nameTextField.text!.isEmpty) {
            SCLAlertView().showError("بعض الحقول فارغة", subTitle:"قم بإدخال الإسم والبريد الالكتروني وكلمة المرور", closeButtonTitle:"حسناً")
        }
        else {
            //Register API
            
        }
        
    }
    
    @IBAction func onClickSigninButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
