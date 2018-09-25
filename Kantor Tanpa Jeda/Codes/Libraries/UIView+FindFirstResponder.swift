//
//  UIView+FindFirstResponder.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/6/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func findFirstResponder() -> Any? {
        if isFirstResponder { return self; }
        for subView in subviews {
            let responder = subView.findFirstResponder()
            if responder != nil { return responder }
        }
        return nil
    }
    
}
