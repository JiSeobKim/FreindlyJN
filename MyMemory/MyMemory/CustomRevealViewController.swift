//
//  CustomRevealViewController.swift
//  MyMemory
//
//  Created by JiseobKim on 06/06/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import UIKit

class CustomRevealViewController: UIViewController {
    
    var frontVC: UIViewController?
    var rearVC: UIViewController?
    let SHOW_WIDTH : CGFloat = 200
    var isShowing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initLayout()

        // Do any additional setup after loading the view.
    }
    
    
    func initData(){
        
    }
    
    func initLayout(){
        // Add Views
        setFrontView()
        
    }
    
    func setFrontView(){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController else { return }
        vc.view.frame = self.view.frame
        vc.didMove(toParent: self)

        
        self.frontVC = vc
        
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        let vcView = vc.viewControllers[0] as! MemoListVC
        vcView.delegate = self
    }
    
    func setRearView(){
        guard rearVC == nil else { return }
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") as? SideBarVC else { return }

        vc.delegate = self
        vc.view.frame = self.view.frame
        vc.didMove(toParent: self)
        
        self.rearVC = vc
        
        
        
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        self.view.bringSubviewToFront(self.frontVC!.view)
    }
    
    func viewShadow(shadow:Bool) {
        switch shadow {
        case true:
            frontVC?.view.layer.cornerRadius = 10
            frontVC?.view.layer.shadowColor = UIColor.black.cgColor
            frontVC?.view.layer.shadowOpacity = 0.2
            frontVC?.view.layer.shadowOffset = CGSize(width: -5, height: 0)
        case false:
            frontVC?.view.layer.cornerRadius = 0
            frontVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
        
        
    }
    
    @objc func toggleSideBar() {
        switch rearVC == nil {
        case true:
            openBar(complete: nil)
        case false:
            closeBar(complete: nil)
        }
        
    }
    
    func openBar(complete:()?){
        setRearView()
        viewShadow(shadow: true)
        UIView.animate(withDuration: TimeInterval(0.3), animations: {
            self.frontVC?.view.frame.origin.x = self.SHOW_WIDTH
        }) {
            if $0 == true {
                self.isShowing = true
            }
        }
    }
    
    func closeBar(complete:()?){
        viewShadow(shadow: false)
        UIView.animate(withDuration: 0.3, animations: {
            self.frontVC?.view.frame.origin.x = 0
        }) {
            if $0 == true {
                self.isShowing = false
                self.rearVC?.view.removeFromSuperview()
                self.rearVC = nil
            }
        }
    }
    
   

}
