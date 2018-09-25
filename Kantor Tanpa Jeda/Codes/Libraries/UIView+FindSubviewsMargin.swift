//
//  UIView+FindSubviewsMargin.swift
//  Family Tree
//
//  Created by Martin Tjandra on 4/4/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var subviewsTopMargin : CGFloat? {
        if subviews.count == 0 { return nil; }
        var result = CGFloat.greatestFiniteMagnitude;
        for v in subviews { if v.top < result { result = v.top; } }
        return result;
    }
    
    var subviewsLeftMargin : CGFloat? {
        if subviews.count == 0 { return nil; }
        var result = CGFloat.greatestFiniteMagnitude;
        for v in subviews { if v.left < result { result = v.left; } }
        return result;
    }

    var subviewsBottomMargin : CGFloat? {
        if subviews.count == 0 { return nil; }
        var result = -CGFloat.greatestFiniteMagnitude;
        for v in subviews { if v.bottom > result { result = v.bottom; } }
        return result;
    }
    
    var subviewsRightMargin : CGFloat? {
        if subviews.count == 0 { return nil; }
        var result = -CGFloat.greatestFiniteMagnitude;
        for v in subviews { if v.right > result { result = v.right; } }
        return result;
    }

    var subviewsMargin : CGMargin? {
        if subviews.count == 0 { return nil; }
        var top = CGFloat.greatestFiniteMagnitude;
        var left = CGFloat.greatestFiniteMagnitude;
        var bottom = -CGFloat.greatestFiniteMagnitude;
        var right = -CGFloat.greatestFiniteMagnitude;
        for v in subviews {
            if v.top < top { top = v.top; }
            if v.left < left { left = v.left; }
            if v.bottom > bottom { bottom = v.bottom; }
            if v.right > right { right = v.right; }
        }
        return CGMargin.init(left: left, top: top, bottom: bottom, right: right);
    }
    
}
