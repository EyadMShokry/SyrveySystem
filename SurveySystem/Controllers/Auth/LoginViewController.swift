//
//  LoginViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/2/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit
import SCLAlertView

class LoginViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCLickSinginButton(_ sender: UIButton) {
        if(emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty) {
            SCLAlertView().showError("بعض الحقول فارغة", subTitle:"قم بإدخال البريد الالكتروني وكلمة المرور", closeButtonTitle:"حسناً")
        }
        else {
            //Login API
//            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "Onboarding")
            homeVC.modalPresentationStyle = .fullScreen
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            self.present(homeVC, animated: true, completion: nil)

        }
    }
    
    @IBAction func onClickForgetPasswordButton(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickCreateAccountButton(_ sender: UIButton) {
        
    }
}

