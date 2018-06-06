//
//  ProfileVC.swift
//  MyMemory
//
//  Created by JiseobKim on 06/06/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let profileImage = UIImageView()
    let tv = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLayout()
        initData()
        
    }
    
    func initData() {
        self.tv.frame = CGRect(x: 0, y: self.profileImage.frame.origin.y + self.profileImage.frame.size.height + 20, width: self.view.frame.width, height: 100)
        
        self.tv.dataSource = self
        self.tv.delegate = self
        self.view.addSubview(tv)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func initLayout() {
        let backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close))
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.navigationItem.title = "프로필"
        
        let image = #imageLiteral(resourceName: "account")
        
        self.profileImage.image = image
        self.profileImage.frame.size = CGSize(width: 100, height: 100)
        self.profileImage.center = CGPoint(x: self.view.center.x
            , y: 270)
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
        self.profileImage.layer.borderWidth = 0
        self.profileImage.layer.masksToBounds = true
        
        self.view.addSubview(profileImage)
        
        // Add Background Image
        let bg = UIImage(named: "profile-bg")
        let bgImg = UIImageView(image: bg)
        
        bgImg.frame.size = CGSize(width: bgImg.frame.size.width, height: bgImg.frame.size.height)
        bgImg.center = CGPoint(x: self.view.frame.width / 2, y: 40)
        bgImg.layer.cornerRadius = bgImg.frame.width / 2
        bgImg.layer.borderWidth = 0
        bgImg.layer.masksToBounds = true
        self.view.addSubview(bgImg)
        self.view.bringSubviewToFront(tv)
        self.view.bringSubviewToFront(profileImage)
    }
    
    @objc func close() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "이름"
            cell.detailTextLabel?.text = "꼼꼼한 지섭씨"
        case 1:
            cell.textLabel?.text = "계정"
            cell.detailTextLabel?.text = "jiseob@iCloud.com"
        default:
            ()
        }
        
        
        return cell
    }


}
