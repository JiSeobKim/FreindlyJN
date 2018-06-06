//
//  ViewController.swift
//  Chapter05_Plist
//
//  Created by JiseobKim on 06/06/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = UserDefaults.standard
        plist.set("홍길동", forKey: "이름")
        plist.set(24, forKey: "나이")
        plist.set("남", forKey: "성별")
        
        plist.synchronize()
        
        let name = plist.string(forKey: "이름")
    }


}

