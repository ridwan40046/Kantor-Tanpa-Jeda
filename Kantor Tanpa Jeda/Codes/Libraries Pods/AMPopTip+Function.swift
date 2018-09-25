//
//  AMPopTip+Function.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/7/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import AMPopTip

let popTip = PopTip();

extension UIView {
    
    func showPopTip (_ text: String?, dir: PopTipDirection = .up, maxWidth: CGFloat? = nil, in: UIView? = nil, bubbleColor: UIColor = UIColor.red, textColor: UIColor = UIColor.white, firstResponder: Bool = true) {
        guard let text = text, let `in` = `in` ?? self.superview else { return; }
        popTip.bubbleColor = bubbleColor;
        popTip.textColor = textColor;
        popTip.font = UIFont.systemFont(ofSize: 14);
        popTip.show(text: text, direction: dir, maxWidth: maxWidth ?? max (200, self.width), in: `in`, from: self.frame, duration: 3);
        if firstResponder { self.traverseResponder { $0.becomeFirstResponder(); } }
    }
    
    func showPopTip (_ text: ArrString?, dir: PopTipDirection = .up, maxWidth: CGFloat? = nil, in: UIView? = nil, firstResponder: Bool = true) {
        guard let text = text?[safe: 0], let `in` = `in` ?? self.superview else { return; }
        popTip.show(text: text, direction: dir, maxWidth: maxWidth ?? max (200, self.width), in: `in`, from: self.frame, duration: 3);
        if firstResponder { self.becomeFirstResponder(); }
    }
    
}
