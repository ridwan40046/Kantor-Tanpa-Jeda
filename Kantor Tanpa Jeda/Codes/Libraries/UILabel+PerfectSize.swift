//
//  UILabel+PerfectSize.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/26/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    var perfectWidth : CGFloat {
        let curFrame = frame;
        frame = CGRect.init(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude);
        sizeToFit();
        let resFrame = frame;
        frame = curFrame;
        return resFrame.width;
    }
    
    func perfectWidth(for string: String?) -> CGFloat {
        let curText = text;
        text = string;
        let resWidth = perfectWidth;
        text = curText;
        return resWidth;
    }
    
}
