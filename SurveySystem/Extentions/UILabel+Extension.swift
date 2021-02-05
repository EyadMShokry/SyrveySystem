//
//  UILabel+Extension.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/5/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

extension UILabel {
    
    func imageResize (image:UIImage, sizeChange:CGSize)-> UIImage{

        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen

        // Create a Drawing Environment (which will render to a bitmap image, later)
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)

        image.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        // Clean up the Drawing Environment (created above)
        UIGraphicsEndImageContext()

        return scaledImage!
    }

    
    func addTrailing(image: UIImage, text: String, resize: Bool) {
        let size = CGSize(width: 80, height: 40)
        let resizedImage = imageResize(image: image, sizeChange: size)
        let attachment = NSTextAttachment()
        if(resize) {
            attachment.image = resizedImage
        }
        else {
            attachment.image = image
        }
        // Set bound to reposition
        let imageOffsetY: CGFloat = -5.0
        attachment.bounds = CGRect(x: 0, y: imageOffsetY, width: attachment.image!.size.width, height: attachment.image!.size.height)

        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text, attributes: [:])

        string.append(attachmentString)
        self.attributedText = string
    }
    
    func addLeading(image: UIImage, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}

