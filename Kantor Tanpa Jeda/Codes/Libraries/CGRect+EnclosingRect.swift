//
//  CGRect+EnclosingRect.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 20/06/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    
    static func enclosing (rects: [CGRect]) -> CGRect {
        if rects.count == 0 { return CGRect.zero; }
        var left : CGFloat = rects[0].origin.x;
        var top : CGFloat = rects[0].origin.y;
        var right : CGFloat = rects[0].origin.x + rects[0].size.width;
        var bottom : CGFloat = rects[0].origin.y + rects[0].size.height;
        
        for rect in rects {
            left = min(rect.origin.x, left);
            right = max(rect.origin.x + rect.size.width, right);
            top = min(rect.origin.y, top);
            bottom = max(rect.origin.y + rect.size.height, bottom);
        }
        return CGRect.init(x: left, y: top, width: right - left, height: bottom - top);
    }
    
}
