//
//  HomeTableViewHeader.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/7/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

protocol HomeHeaderViewDelegate {
    func didAddNewSurveyPressed()
}

class HomeTableViewHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var brandLogo: UIImageView!
    @IBOutlet weak var brandName: UIButton!
    @IBOutlet weak var addSurveyButton: UIButton!
    @IBOutlet weak var lovePersentage: UILabel!
    @IBOutlet weak var veryHappyPersentage: UILabel!
    @IBOutlet weak var happyPersentage: UILabel!
    @IBOutlet weak var sadPersentage: UILabel!
    
    var delegate: HomeHeaderViewDelegate?

    
    @IBAction func onClickAddSurveyButton(_ sender: UIButton) {
        delegate?.didAddNewSurveyPressed()
    }
    
    @IBAction func onClickShowMoreForLove(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickShowMoreForVeryHappy(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickShowMoreForHappy(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickShowMoreForSad(_ sender: Any) {
        
    }
    
}
