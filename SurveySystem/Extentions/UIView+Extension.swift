//
//  UIView+Extension.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/6/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

extension UIView {
    func animateButtonDown() {
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
    
    func animateButtonUp() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
}

