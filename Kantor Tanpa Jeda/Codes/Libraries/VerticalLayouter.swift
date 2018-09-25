//
//  VerticalLayouter.swift
//  Family Tree
//
//  Created by Martin Tjandra on 4/2/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

class VerticalLayouter {
    
    var views = [UIView]();
    var parentView : UIView?;
    
    init(views: [UIView] = [], parentView: UIView? = nil) {
        self.views = views;
        self.parentView = parentView;
    }
    
    func clear() { views.removeAll(); }
    /** Currently only accepts UILabel */
    func add (view: UIView?) {
        guard let view = view else { return; }
        views.append(view);
    }
    func sort() { views.sort { $0.y < $1.y } }
    
    @discardableResult
    func doLayout() -> CGFloat {
        var verticalOffset : CGFloat  = 0;
        for i in 0..<views.count - 1 {
            // set the height offset from the accumulation of the offsets from the previous elements
            let el = views[i];
            el.y += verticalOffset;
            // count the current target height
            var targetHeight : CGFloat = el.height;
            if let d = el as? UILabel { targetHeight = d.getPerfectHeight(); } else { continue; }
            // accumulate the diff to the offsets
            verticalOffset += targetHeight - el.height;
            el.height = targetHeight;
        }
        parentView?.height += verticalOffset;
        return verticalOffset;
    }
    
}
