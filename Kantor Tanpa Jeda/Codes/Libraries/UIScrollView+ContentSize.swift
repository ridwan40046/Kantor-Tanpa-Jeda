//
//  UIScrollView+ContentSize.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/1/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    var contentWidth : CGFloat {
        get { return self.contentSize.width; }
        set { var d = self.contentSize; d.width = newValue; self.contentSize = d; }
    }
    
    var contentHeight : CGFloat {
        get { return self.contentSize.height; }
        set { var d = self.contentSize; d.height = newValue; self.contentSize = d; }
    }
}
