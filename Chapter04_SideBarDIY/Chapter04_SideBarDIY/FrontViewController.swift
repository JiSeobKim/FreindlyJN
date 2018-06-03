//
//  FrontViewController.swift
//  Chapter04_SideBarDIY
//
//  Created by JiseobKim on 2018. 6. 3..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    var delegate : RevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addGesture()
        
    }

    func addGesture() {
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        
        dragLeft.edges = .left
        self.view.addGestureRecognizer(dragLeft)
        
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragRight.direction = .left
        self.view.addGestureRecognizer(dragRight)
        
        
    }
    
    

    @IBAction func moveSide(_ sender: Any) {
        
        if sender is UIScreenEdgePanGestureRecognizer {
            self.delegate?.closeSideBar(nil)
        } else if sender is UISwipeGestureRecognizer {
            self.delegate?.closeSideBar(nil)
        } else {
            if self.delegate?.isSideBarShowing == true {
                self.delegate?.closeSideBar(nil)
            } else {
                self.delegate?.openSideBar(nil)
            }
        }
    }
    
}
