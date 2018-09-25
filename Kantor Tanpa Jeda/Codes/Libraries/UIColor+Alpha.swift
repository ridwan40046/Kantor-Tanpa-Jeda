//
//  UIColor+Alpha.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/9/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    func alpha(_ a: CGFloat) -> UIColor { return self.withAlphaComponent(a); }
    
}
