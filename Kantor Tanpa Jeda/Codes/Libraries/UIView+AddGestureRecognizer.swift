//
//  UIView+AddTarget.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/27/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView : UIGestureRecognizerDelegate {
    
    func addTapGestureRecognizer(_ target: Any?, action: Selector?) {
        self.isUserInteractionEnabled = true;
        let tap = UITapGestureRecognizer(target: target, action: action);
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
}
