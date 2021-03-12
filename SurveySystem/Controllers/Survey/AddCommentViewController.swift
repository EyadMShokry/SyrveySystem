//
//  AddCommentViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/4/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit
import iRecordView
import SCLAlertView

class AddCommentViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var recordButton: RecordButton!
    @IBOutlet weak var recordView: RecordView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adjustCommentTextView()
        recordButton.recordView = self.recordView
        recordView.delegate = self
        recordView.isSoundEnabled = true
        recordButton.tintColor = .white
        recordView.slideToCancelTextColor = .systemRed
    }
    
    fileprivate func adjustCommentTextView() {
        commentTextView.delegate = self
        commentTextView.textColor = UIColor(displayP3Red: 123/255, green: 123/255, blue: 123/255, alpha: 1.0)
        commentTextView.text = "اكتب تعليقاتك هنا"
    }

    
    @IBAction func onClickOkButton(_ sender: UIButton) {
        let thankingVC = self.storyboard!.instantiateViewController(withIdentifier: "Thanking")
        thankingVC.modalPresentationStyle = .fullScreen
        self.present(thankingVC, animated: true, completion: nil)
    }
    
}


extension AddCommentViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(displayP3Red: 123/255, green: 123/255, blue: 123/255, alpha: 1.0) {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespaces).isEmpty {
            textView.text = "اكتب تعليقاتك هنا"
            textView.textColor = UIColor(displayP3Red: 123/255, green: 123/255, blue: 123/255, alpha: 1.0)
        }
    }

}


extension AddCommentViewController: RecordViewDelegate {
    func onStart() {
        
    }
    
    func onCancel() {
        
    }
    
    func onFinished(duration: CGFloat) {
        SCLAlertView().showSuccess("تم بنجاح", subTitle: "سيتم إرفاق رسالتك النصية مع استطلاع الرأي")
        print(duration)
    }
    
    
}
