//
//  VC2.swift
//  Chapter03_NavigationBar
//
//  Created by JiseobKim on 2018. 5. 29..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTitleInput()
        initLeftItem()
        initRightItem()
    }
    
    func initTitleInput() {
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1).cgColor
        self.navigationItem.titleView = tf
    }
    
    func initLeftItem() {
        let img = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: img, style: .plain, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }

    func initRightItem() {
        
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let rItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rItem
        
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        cnt.text = "12"
        cnt.textAlignment = .center
        cnt.layer.borderWidth = 2
        cnt.layer.cornerRadius = 3
        cnt.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1).cgColor
        
        rv.addSubview(cnt)
        
        
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named:"more"), for: .normal)
        
        rv.addSubview(more)
    }
   
}
