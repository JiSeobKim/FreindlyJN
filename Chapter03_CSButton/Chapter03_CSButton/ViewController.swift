//
//  ViewController.swift
//  Chapter03_CSButton
//
//  Created by JiseobKim on 2018. 5. 30..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let btn = CSButton()
        
        
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

