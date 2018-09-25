//
//  CGRect+MaxSize.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/1/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    
    static var maxSize : CGRect {
        return CGRect.init(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude);
    }
    
}
