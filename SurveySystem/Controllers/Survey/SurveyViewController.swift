//
//  SurveyViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/5/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit
import SCLAlertView

class SurveyViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var beamingFaceButton: UIButton!
    @IBOutlet weak var smileFaceButton: UIButton!
    @IBOutlet weak var sadFaceButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var questionsArray: [String] = ["  القهوة ؟  ", "الخدمة ؟", "الموظفين ؟  ", "النظافة ؟  ", "هل ستعود مرة اخرى ؟"]
    var questionsImages: [String] = ["coffee", "cooking-food", "employees", "glare", "welcome"]
    var selectedAnswers: [Int] = [0,0,0,0,0]
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.addTrailing(image: UIImage(named: questionsImages[currentQuestionIndex])!, text: questionsArray[currentQuestionIndex], resize: false)
    }
    
    fileprivate func changeStateFor(button: UIButton) {
        if(button == loveButton) {
            self.selectedAnswers[currentQuestionIndex] = 1
            self.loveButton.setImage(UIImage(named: "heartFilled"), for: .normal)
            self.beamingFaceButton.animateButtonDown()
            self.smileFaceButton.animateButtonDown()
            self.sadFaceButton.animateButtonDown()
            self.beamingFaceButton.setImage(UIImage(named: "beamingFace"), for: .normal)
            self.smileFaceButton.setImage(UIImage(named: "smileFace"), for: .normal)
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        }
        else if(button == beamingFaceButton) {
            self.selectedAnswers[currentQuestionIndex] = 2
            self.beamingFaceButton.setImage(UIImage(named: "beaming-faceFilled"), for: .normal)
            self.loveButton.animateButtonDown()
            self.smileFaceButton.animateButtonDown()
            self.sadFaceButton.animateButtonDown()
            self.loveButton.setImage(UIImage(named: "heart"), for: .normal)
            self.smileFaceButton.setImage(UIImage(named: "smileFace"), for: .normal)
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        }
        else if(button == smileFaceButton) {
            self.selectedAnswers[currentQuestionIndex] = 3
            self.smileFaceButton.setImage(UIImage(named: "smileFaceFilled"), for: .normal)
            self.loveButton.animateButtonDown()
            self.beamingFaceButton.animateButtonDown()
            self.sadFaceButton.animateButtonDown()
            self.loveButton.setImage(UIImage(named: "heart"), for: .normal)
            self.beamingFaceButton.setImage(UIImage(named: "beamingFace"), for: .normal)
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        }
        else {
            self.selectedAnswers[currentQuestionIndex] = 4
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
            self.loveButton.animateButtonDown()
            self.beamingFaceButton.animateButtonDown()
            self.smileFaceButton.animateButtonDown()
            self.loveButton.setImage(UIImage(named: "heart"), for: .normal)
            self.beamingFaceButton.setImage(UIImage(named: "beamingFace"), for: .normal)
            self.smileFaceButton.setImage(UIImage(named: "smileFace"), for: .normal)
        }
    }
    
    @IBAction func onClickRateButton(_ sender: UIButton) {
        changeStateFor(button: sender)
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )

    }

    fileprivate func resetButtons() {
        self.loveButton.setImage(UIImage(named: "heart"), for: .normal)
        self.beamingFaceButton.setImage(UIImage(named: "beamingFace"), for: .normal)
        self.smileFaceButton.setImage(UIImage(named: "smileFace"), for: .normal)
        self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        
        self.loveButton.animateButtonUp()
        self.beamingFaceButton.animateButtonUp()
        self.smileFaceButton.animateButtonUp()
        self.sadFaceButton.animateButtonUp()
    }
    
    @IBAction func onClickNextButton(_ sender: UIButton) {
        resetButtons()
        print(selectedAnswers)
        if(selectedAnswers[currentQuestionIndex] == 0) {
            SCLAlertView().showError("بعض الحقول فارغة", subTitle:"قم باختيار أحد الرموز التعبيرية", closeButtonTitle:"حسناً")
        }
        else {
            if(self.currentQuestionIndex < 4) {
                self.currentQuestionIndex = self.currentQuestionIndex + 1
                if(currentQuestionIndex == 0 || currentQuestionIndex == 3) {
                    questionLabel.addTrailing(image: UIImage(named: questionsImages[currentQuestionIndex])!, text: questionsArray[currentQuestionIndex], resize: false)
                }
                else {
                    questionLabel.addTrailing(image: UIImage(named: questionsImages[currentQuestionIndex])!, text: questionsArray[currentQuestionIndex], resize: true)
                }
            }
            else {
                // redirect to comments screen
                let commentsVC = storyboard?.instantiateViewController(identifier: "AddComment") as! AddCommentViewController
                self.navigationController?.pushViewController(commentsVC, animated: true)
            }
        }
    }
    
}
