//
//  LoginViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/2/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit
import SCLAlertView
import TransitionButton

class LoginViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signInButton: TransitionButton!
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
            signInButton.startAnimation() // 2: Then start the animation when the user tap the button
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(2) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    self.signInButton.stopAnimation(animationStyle: .expand, completion: {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeNavigationController = storyboard.instantiateViewController(withIdentifier: "HomeNavigation")
                        homeNavigationController.modalPresentationStyle = .fullScreen
                        self.emailTextField.text = ""
                        self.passwordTextField.text = ""
                        self.present(homeNavigationController, animated: true, completion: nil)
                    })
                })
            })
        }
    }
    
    @IBAction func onClickForgetPasswordButton(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickCreateAccountButton(_ sender: UIButton) {
        
    }
}

