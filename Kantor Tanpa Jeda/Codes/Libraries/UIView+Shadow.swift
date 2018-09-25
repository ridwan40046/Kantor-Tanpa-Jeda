//
//  UIView+Shadow.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/13/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /** r = radius, a = alpha, c = color */
    func setShadow (x: CGFloat = 0, y: CGFloat = 3, r: CGFloat = 5, a: Float = 0.5, c: UIColor = UIColor.black) {
        
        layer.shadowOffset = CGSize.init(width: x, height: y);
        layer.shadowColor = c.cgColor;
        layer.shadowRadius = r;
        layer.shadowOpacity = a;
    }
    
    func noShadow () {
        layer.shadowOpacity = 0;
    }
    
}
