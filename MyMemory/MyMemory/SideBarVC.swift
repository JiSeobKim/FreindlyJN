//
//  SideBarVC.swift
//  MyMemory
//
//  Created by JiseobKim on 2018. 6. 3..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class SideBarVC: UITableViewController {

    
    let titles = ["새글 작성하기,","친구 새글", "달력으로 보기", "공지사항", "통계", "계정 관리"]
    let icons = [#imageLiteral(resourceName: "icon01"),#imageLiteral(resourceName: "icon02"),#imageLiteral(resourceName: "icon03"),#imageLiteral(resourceName: "icon04"),#imageLiteral(resourceName: "icon05"),#imageLiteral(resourceName: "warning-icon-60")]
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()
    
    var delegate : CustomRevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        headerView.backgroundColor = .brown
        
        self.tableView.tableHeaderView = headerView
        
        // Add Label
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.nameLabel.text = "꼼꼼한 지섭씨"
        self.nameLabel.textColor = .white
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.nameLabel.backgroundColor = .clear
        
        
        self.emailLabel.text = "testEmail@icloud.com"
        self.emailLabel.sizeToFit()
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 150, height: 30)
        self.emailLabel.textColor = .white
        self.emailLabel.font = UIFont.systemFont(ofSize: 11)
        self.emailLabel.backgroundColor = .clear
        
        self.profileImage.image = #imageLiteral(resourceName: "account")
        
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        headerView.addSubview(profileImage)
        headerView.addSubview(nameLabel)
        headerView.addSubview(emailLabel)
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileImage.layer.masksToBounds = true
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
        
            let parentView = self.parent as! CustomRevealViewController
            let frontView = parentView.frontVC as! UINavigationController
            
            delegate?.closeBar(complete: {
                frontView.pushViewController(uv!, animated: true)
            }())
            
            
            
            
            
            
            
//
//            let target = self.revealViewController().frontViewController as! UINavigationController
//
//
//
//            target.pushViewController(uv!, animated: true)
//            self.revealViewController().revealToggle(self)
            
//        case 5:
//            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "_Profile") {
//                self.present(vc, animated: true) {
//                    self.revealViewController().revealToggle(self)
//                }
//            }
        default:
            break
        }
    }
}
