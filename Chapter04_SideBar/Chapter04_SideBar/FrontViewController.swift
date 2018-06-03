//
//  FrontViewController.swift
//  Chapter04_SideBar
//
//  Created by JiseobKim on 2018. 6. 3..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet var btnSideBar: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let revealVC = self.revealViewController() {
            self.btnSideBar.target = revealVC
            self.btnSideBar.action = #selector(revealVC.revealToggle(_:))
            
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
