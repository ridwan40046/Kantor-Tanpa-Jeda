//
//  UIView+RemoveAllSubviews.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/8/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeAllSubviews(); }
        subviews.forEach { $0.removeFromSuperview(); }
    }
    
}
