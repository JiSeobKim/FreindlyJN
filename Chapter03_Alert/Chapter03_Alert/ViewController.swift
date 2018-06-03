//
//  ViewController.swift
//  Chapter03_Alert
//
//  Created by JiseobKim on 2018. 5. 29..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        defaultPractice()
        mapPractice()
        
        listPractice()
        
        
        
    }
    
    
    func defaultPractice() {
        let defaultAertBtn = UIButton(type: .system)
        defaultAertBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        defaultAertBtn.center = self.view.center
        defaultAertBtn.setTitle("기본 알림창", for: .normal)
        defaultAertBtn.addTarget(self, action: #selector(defaultAlert), for: .touchUpInside)
        self.view.addSubview(defaultAertBtn)
    }
    
    @objc func defaultAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let v = UIViewController()
        v.view.backgroundColor = .red
        
        alert.setValue(v, forKey: "contentViewController")
        
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func mapPractice(){
        let AlertBtn = UIButton(type: .system)
        AlertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        AlertBtn.center.x = self.view.center.x
        AlertBtn.setTitle("Map Alert", for: .normal)
        AlertBtn.addTarget(self, action: #selector(mapAlert), for: .touchUpInside)
        self.view.addSubview(AlertBtn)
 
    }
    
    @objc func mapAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil,
                                      message: "여기가 맞나요?",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let contentVC = UIViewController()
        
        let mapKit = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let region = MKCoordinateRegion(center: pos, span: span)
        
        mapKit.region = region
        mapKit.regionThatFits(region)
        
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapKit.addAnnotation(point)
        
        
        contentVC.view = mapKit
        contentVC.preferredContentSize.height = 200
        alert.setValue(contentVC, forKey: "contentViewController")
        
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func listPractice() {
        
        let listBtn = UIButton(type: .system)
        listBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        listBtn.center.x = self.view.center.x
        listBtn.setTitle("List Alert", for: .normal)
        listBtn.addTarget(self, action: #selector(listAlert), for: .touchUpInside)
        
        self.view.addSubview(listBtn)
    }
    
    @objc func listAlert() {
        
        let contentVC = ListViewController()
        let alert =  UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        contentVC.delegate = self
        
        self.present(alert, animated: true, completion: nil)
        
    }

    
    func didSelectRowAt(indexPath: IndexPath){
        print(">>> 선택된 행은 \(indexPath.row)입니다")
    }

}

