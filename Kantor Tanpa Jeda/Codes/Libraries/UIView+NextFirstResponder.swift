//
//  UIView+NextFirstResponder.swift
//  Family Tree
//
//  Created by Martin Tjandra on 4/3/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var nextFirstResponder : UIView? { return tag == 0 ? nil : superview?.viewWithTag(tag + 1); }
    
}
