//
//  UIScrollView+Page.swift
//  Family Tree
//
//  Created by Martin Tjandra on 17/04/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    var hPage : CGFloat {
        get { return self.contentOffset.x / self.frame.size.width; }
        set { let newPos = CGPoint.init(x: newValue * self.frame.size.width, y: self.contentOffset.y);
            self.setContentOffset(newPos, animated: true); }
    }

    var vPage : CGFloat {
        get { return self.contentOffset.y / self.frame.size.height; }
        set { let newPos = CGPoint.init(x: self.contentOffset.x, y: newValue * self.frame.size.height);
            self.setContentOffset(newPos, animated: true); }
    }
    
}
