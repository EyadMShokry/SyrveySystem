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
import TransitionButton

class RegisterAccountViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameTextField: HoshiTextField!
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var registerButton: TransitionButton!
    
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
            registerButton.startAnimation() // 2: Then start the animation when the user tap the button
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(2) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    self.registerButton.stopAnimation(animationStyle: .expand, completion: {
                        self.navigationController?.popViewController(animated: true)
                    })
                })
            })
        }
        
    }
    
    @IBAction func onClickSigninButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
