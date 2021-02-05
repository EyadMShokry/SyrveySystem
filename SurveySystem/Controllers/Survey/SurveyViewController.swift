//
//  SurveyViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/5/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var beamingFaceButton: UIButton!
    @IBOutlet weak var smileFaceButton: UIButton!
    @IBOutlet weak var sadFaceButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.addTrailing(image: UIImage(named: "coffee")!, text: "القهوة ؟  ")
    }
    
    fileprivate func changeStateFor(button: UIButton) {
        if(button == loveButton) {
            self.loveButton.setImage(UIImage(named: "heartFilled"), for: .normal)
            self.beamingFaceButton.setImage(UIImage(named: "beamingFace"), for: .normal)
            self.smileFaceButton.setImage(UIImage(named: "smileFace"), for: .normal)
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        }
        else if(button == beamingFaceButton) {
            self.beamingFaceButton.setImage(UIImage(named: "beaming-faceFilled"), for: .normal)
            self.loveButton.setImage(UIImage(named: "heart"), for: .normal)
            self.smileFaceButton.setImage(UIImage(named: "smileFace"), for: .normal)
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        }
        else if(button == smileFaceButton) {
            self.smileFaceButton.setImage(UIImage(named: "smileFaceFilled"), for: .normal)
            self.loveButton.setImage(UIImage(named: "heart"), for: .normal)
            self.beamingFaceButton.setImage(UIImage(named: "beamingFace"), for: .normal)
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
        }
        else {
            self.sadFaceButton.setImage(UIImage(named: "downcastFace"), for: .normal)
            self.sadFaceButton.setTitleColor(UIColor(displayP3Red: 255/255, green: 208/255, blue: 94/255, alpha: 1.0), for: .normal)
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

    @IBAction func onClickNextButton(_ sender: UIButton) {
    }
    
}
