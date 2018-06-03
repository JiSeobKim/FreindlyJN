//
//  ListViewController.swift
//  Chapter03_Alert
//
//  Created by JiseobKim on 2018. 5. 30..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var delegate : ViewController?
    
    override func viewDidLoad() {
        self.preferredContentSize.height = 220
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(indexPath.row)번째 옵션입니다."
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRowAt(indexPath: indexPath)
    }
    

}
