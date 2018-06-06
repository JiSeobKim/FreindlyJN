//
//  ListViewController.swift
//  Chapter05_UserDefault
//
//  Created by JiseobKim on 06/06/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import UIKit
import Foundation

public enum GenderType : Int {
    case Man = 0
    case Women = 1
    
    public func getGenderValue(value:Int) -> GenderType? {
        switch value {
        case 0:
            return .Man
        case 1:
            return .Women
        default:
            return nil
        }
    }
    
    public func getGenderCode(value: GenderType) -> Int {
        return value.rawValue
    }
}

class ListViewController: UITableViewController {

    @IBOutlet var name: UILabel!
    
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var married: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
        let pList = UserDefaults.standard
        let name = pList.string(forKey: "name")
        let gender = pList.integer(forKey: "gender")
        let married = pList.bool(forKey: "married")
        
        self.name.text = name
        self.gender.selectedSegmentIndex = gender
        self.married.isOn = married
        
        customPropertyList()
    }

    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let valueType : GenderType?
        
        switch gender.selectedSegmentIndex {
        case 0:
            valueType = .Man
        case 1:
            valueType = .Women
        default:
            valueType = nil
        }
        
        let pList = UserDefaults.standard
        
        
        pList.set(valueType?.rawValue, forKey: "gender")
        pList.synchronize()
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn
        
        let pList = UserDefaults.standard
        pList.set(value, forKey: "married")
        pList.synchronize()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            alert.addTextField() {
                $0.text = self.name.text
            }
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                let text = alert.textFields?[0].text
                let pList = UserDefaults.standard
                pList.set(text, forKey: "name")
                pList.synchronize()
                
                self.name.text = text
                self.name.sizeToFit()
                
            }))
            
            
            self.present(alert, animated: true)
        default:
            ()
        }
    }
    
    
    func customPropertyList() {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

        let path = paths[0] as NSString
        
        let plist = path.strings(byAppendingPaths: ["data.plist"]).first!
        let data = NSMutableDictionary(contentsOfFile: plist)


        let name = data?.value(forKey: "이름") as? String
        let age = data?.value(forKey: "나이") as? Int
        
        if let _name = name {
            print(_name)
        }
        
        if let _age = age {
            print(_age)
        }
        
        data?.setValue("꼼꼼하네", forKey: "이름")
        data?.setValue(32, forKey: "나이")
        data?.setValue("여", forKey: "성별")
        
        data?.write(toFile: plist, atomically: true)
        
    }

}
