//
//  UIView+Positioning.swift
//  FamilyTree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var top: CGFloat {
        get { return self.frame.origin.y; }
        set {
            var frame = self.frame;
            let diff = newValue - frame.origin.y;
            frame.size.height -= diff;
            frame.origin.y += diff;
            self.frame = frame;
        }
    }
    
    var bottom: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height; }
        set {
            var frame = self.frame;
            frame.size.height = newValue - frame.origin.y;
            self.frame = frame;
        }
    }
    
    var left: CGFloat {
        get { return self.frame.origin.x; }
        set {
            var frame = self.frame;
            let diff = newValue - frame.origin.x;
            frame.size.width -= diff;
            frame.origin.x += diff;
            self.frame = frame;
        }
    }
    
    var right: CGFloat {
        get { return self.frame.origin.x + self.frame.size.width; }
        set {
            var frame = self.frame;
            frame.size.width = newValue - frame.origin.x;
            self.frame = frame;
        }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height; }
        set {
            var frame = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
    }
    
    var width: CGFloat {
        get { return self.frame.size.width; }
        set {
            var frame = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
    }
    
    var y: CGFloat {
        get { return self.frame.origin.y; }
        set {
            var frame = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
    }
    
    var xOnScreen: CGFloat {
        let localPoint = self.bounds.origin;
        let basePoint = self.convert(localPoint, to: nil);
        return basePoint.x;
    }
    
    var yOnScreen: CGFloat {
        let localPoint = self.bounds.origin;
        let basePoint = self.convert(localPoint, to: nil);
        return basePoint.y;
    }
    
    var centerX: CGFloat { return self.center.x; }
    var centerY: CGFloat { return self.center.y; }
    
    func centeredY() {
        guard let superview = superview else { return; }
        self.center = CGPoint.init(x: self.center.x, y: superview.bounds.center.y);
    }
    
    func centeredX() {
        guard let superview = superview else { return; }
        self.center = CGPoint.init(x: superview.bounds.center.x, y: self.center.y);
    }
    
    func centered() {
        guard let superview = superview else { return; }
        self.center = superview.bounds.center;
    }
}
