//
//  CSButton.swift
//  Chapter03_CSButton
//
//  Created by JiseobKim on 2018. 5. 30..
//  Copyright © 2018년 JiseobKim. All rights reserved.
//

import UIKit

@IBDesignable
class CSButton: UIButton {
    
    @IBInspectable var integer: Int = 0
    @IBInspectable var borderColor : UIColor = UIColor.black

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle(" qwe", for: .normal)
    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.backgroundColor = .red
//
//    }

    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    
}
