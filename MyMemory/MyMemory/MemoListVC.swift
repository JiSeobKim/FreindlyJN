//
//  ViewController.swift
//  MyMemory
//
//  Created by JiseobKim on 2018. 5. 14..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    
    var delegate : CustomRevealViewController?
    let ad = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    func setNavigation() {
        let sideBtn = UIBarButtonItem(image: UIImage(named: "sidemenu"), style: .plain, target: self, action: #selector(toggleSideBar(_:)))
        
        
        self.navigationItem.title = "목록"
        self.navigationItem.leftBarButtonItem = sideBtn
    }
    
    
    @objc func toggleSideBar(_ sender : UIBarButtonItem){
        delegate?.toggleSideBar()
        switch delegate!.isShowing {
        case true:
            delegate?.closeBar(complete: nil)
        case false:
            delegate?.openBar(complete: nil)
        }
    }

    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return ad.memoList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = ad.memoList[indexPath.row]
        
        let callId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: callId) as? MemoCell
        
        cell?.subject?.text = row.title
        cell?.contents?.text = row.contents
        cell?.img?.image = row.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell?.regDate.text = formatter.string(from: row.regDate!)
        
        return cell!
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.ad.memoList[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else { return }
        
        vc.param = row
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

