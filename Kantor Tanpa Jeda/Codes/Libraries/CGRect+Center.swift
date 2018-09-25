//
//  CGRect+Center.swift
//  Family Tree
//
//  Created by Martin Tjandra on 17/04/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    
    var center: CGPoint {
        return CGPoint.init(x: (origin.x + size.width) / 2, y: (origin.y + size.height) / 2);
    }
    
}
