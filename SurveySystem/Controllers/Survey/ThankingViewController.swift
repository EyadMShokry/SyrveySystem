//
//  ThankingViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/5/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

class ThankingViewController: UIViewController {
    @IBOutlet weak var goHomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        goHomeButton.layer.borderColor = UIColor(displayP3Red: 150/255, green: 187/255, blue: 124/255, alpha: 1.0).cgColor
    }
    

    @IBAction func onClickGoHomeButton(_ sender: UIButton) {
        let homeNavigationController = storyboard?.instantiateViewController(identifier: "HomeNavigation")
        homeNavigationController!.modalPresentationStyle = .fullScreen
        self.present(homeNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func onClickAddAnotherFeedbackButton(_ sender: UIButton) {
        let surveyNavigationController = storyboard?.instantiateViewController(identifier: "SurveyNavigation")
        surveyNavigationController!.modalPresentationStyle = .fullScreen
        self.present(surveyNavigationController!, animated: true, completion: nil)

    }
}
