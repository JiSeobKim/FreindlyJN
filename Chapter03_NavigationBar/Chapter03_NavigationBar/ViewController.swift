//
//  ViewController.swift
//  Chapter03_NavigationBar
//
//  Created by JiseobKim on 2018. 5. 29..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        initTitle()
//        initTitleNew()
//        initTitleImage()
        initTitleInput()
        initLeftItem()
    }


    func initTitle(){
        
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.font = UIFont.systemFont(ofSize: 15)
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        nTitle.textColor = .white
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1)
        self.navigationItem.titleView = nTitle
    }
    
    func initTitleNew(){
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        topTitle.textAlignment = .center
        topTitle.font = UIFont.boldSystemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 20))
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1)
        self.navigationItem.titleView = containerView
    }
    
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let view = UIImageView(image: image)
        
        self.navigationItem.titleView = view
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
        let item = UIBarButtonItem()
        self.navigationItem.leftBarButtonItem = item
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
        v.backgroundColor = .brown
        
        item.customView = v
        
        let rV = UIView()
        rV.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
        rV.backgroundColor = .brown
        
        let rItem = UIBarButtonItem(customView: rV)
        
        self.navigationItem.rightBarButtonItem = rItem
        
        
        
    }
}

