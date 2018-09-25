//
//  CGMargin.swift
//  Family Tree
//
//  Created by Martin Tjandra on 4/4/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

public struct CGMargin {
    
    public var top : CGFloat;
    public var left : CGFloat;
    public var bottom : CGFloat;
    public var right : CGFloat;

    public init() { top = 0; left = 0; bottom = 0; right = 0; }
    public init(rect: CGRect) {
        top = rect.origin.y;
        left = rect.origin.x;
        bottom = rect.origin.y + rect.size.height;
        right = rect.origin.x + rect.size.width;
    }
    public init(left: CGFloat, top: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.top = top;
        self.left = left;
        self.right = right;
        self.bottom = bottom;
    }
    public init(left: Int, top: Int, bottom: Int, right: Int) {
        self.top = CGFloat(top);
        self.left = CGFloat(left);
        self.right = CGFloat(right);
        self.bottom = CGFloat(bottom);
    }
    public init(left: Double, top: Double, bottom: Double, right: Double) {
        self.top = CGFloat(top);
        self.left = CGFloat(left);
        self.right = CGFloat(right);
        self.bottom = CGFloat(bottom);
    }
    
    public init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.top = y;
        self.left = x;
        self.right = x + width;
        self.bottom = y + height;
    }
    
    public init(x: Double, y: Double, width: Double, height: Double) {
        self.top = CGFloat(y);
        self.left = CGFloat(x);
        self.right = CGFloat(x + width);
        self.bottom = CGFloat(y + height);
    }
    
    public init(x: Int, y: Int, width: Int, height: Int) {
        self.top = CGFloat(y);
        self.left = CGFloat(x);
        self.right = CGFloat(x + width);
        self.bottom = CGFloat(y + height);
    }
    
    var rect: CGRect {
        return CGRect.init(x: left, y: top, width: right - left, height: bottom - top);
    }

}

extension CGRect {
    
    var margin: CGMargin { return CGMargin.init(rect: self); }
    
}
