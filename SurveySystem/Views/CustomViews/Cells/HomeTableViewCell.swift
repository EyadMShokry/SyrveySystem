//
//  HomeTableViewCell.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/7/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    static let identifier = "HomeCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(string: String) {
        cellLabel.text = string
    }

}
