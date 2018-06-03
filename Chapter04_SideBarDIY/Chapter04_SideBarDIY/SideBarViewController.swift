//
//  SideBarViewController.swift
//  Chapter04_SideBarDIY
//
//  Created by JiseobKim on 2018. 6. 3..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class SideBarViewController: UITableViewController {

    // Title
    let titles = [
        "메뉴 01",
        "메뉴 02",
        "메뉴 03",
        "메뉴 04",
        "메뉴 05",
    ]
    
    let icons = [#imageLiteral(resourceName: "icon01"),#imageLiteral(resourceName: "icon02"),#imageLiteral(resourceName: "icon03"),#imageLiteral(resourceName: "icon04"),#imageLiteral(resourceName: "icon05")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        
        accountLabel.text = "jiseob812@naver.com"
        accountLabel.textColor = .white
        accountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let v = UIView()
        v.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accountLabel)
        
        self.tableView.tableHeaderView = v
        self.tableView.tableFooterView = UIView()
    }
    
    
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



}
