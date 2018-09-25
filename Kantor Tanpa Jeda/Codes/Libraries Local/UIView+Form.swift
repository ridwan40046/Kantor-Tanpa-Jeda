//
//  UIView+Form.swift
//  Queue Manager
//
//  Created by Martin Tjandra on 02/05/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setBorderForForm() {
        
        self.layer.borderColor = UIColor.init(rgbHex: 0x102B72).alpha(0.3).cgColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = true;
        
    }
    
    func setSubButtonsRounded() {
        
        self.traverse {
            if let btn = $0 as? UIButton, let sview = btn.superview, btn.width == sview.width, btn.height == sview.height {
                sview.makeRoundedRect(withCornerRadius: 5);
            }
        }
        
    }
    
}
