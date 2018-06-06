//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by JiseobKim on 2018. 5. 14..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    var subject : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contents.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard self.contents.text.isEmpty == false else{
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        
        let data = MemoData()
        data.title = subject
        data.contents = contents.text
        data.image = preview.image
        data.regDate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.preview.image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
        
        
        
        picker.dismiss(animated: true)
    }
    
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImageView
//        picker.dismiss(animated: false)
//    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        
        let length = contents.length > 15 ? 15 : contents.length
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        self.navigationItem.title = subject
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
