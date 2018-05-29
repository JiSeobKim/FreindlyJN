//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by JiseobKim on 2018. 5. 14..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import Foundation
import UIKit

class MemoReadVC : UIViewController {
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    var param : MemoData?
    
    
    override func viewDidLoad() {
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: (param?.regDate)!)
        
        self.navigationItem.title = dateString
    }
}
