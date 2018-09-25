//
//  UITableViewCell+HeightToFit.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/5/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    /** Supports text view and label */
    func heightToFit (tag: Int?, text: String?, maxHeight: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        guard let tag = tag, let text = text, let obj = view(tag) else { return height; }
        switch obj {
        case let obj as UITextView: return height + min (obj.getHeightDiff(forText: text), maxHeight);
        case let obj as UILabel: return height + min (obj.getHeightDiff(forText: text), maxHeight);
        default: return height;
        }
        
    }
    
}
