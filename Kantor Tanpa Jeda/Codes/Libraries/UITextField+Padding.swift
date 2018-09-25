//
//  UITextField+Padding.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/19/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    var leftPadding : CGFloat {
        set {
            leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: leftPadding, height: self.height));
            leftViewMode = UITextFieldViewMode.always;
        }
        get {
            return leftView?.width ?? 0;
        }
    }
    
    var rightPadding : CGFloat {
        set {
            rightView = UIView(frame: CGRect.init(x: 0, y: 0, width: rightPadding, height: self.height));
            rightViewMode = UITextFieldViewMode.always;
        }
        get {
            return rightView?.width ?? 0;
        }
    }
    
    func setPadding (left: CGFloat, right: CGFloat) {
        leftPadding = left;
        rightPadding = right;
    }
    
}
