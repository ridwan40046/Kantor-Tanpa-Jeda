//
//  UIViewController+FirstResponder.swift
//  FamilyTree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var firstResponder : AnyObject? {
        get { return UIResponder.firstResponder; }
        set { _ = newValue?.becomeFirstResponder(); }
    }
    
    var firstResponderTextField : UITextField? { return UIResponder.firstResponder as? UITextField; }
    var firstResponderTextView : UITextView? { return UIResponder.firstResponder as? UITextView; }
    
    func findFirstResponder() -> AnyObject? {
        if isFirstResponder {
            return self
        }
        for subView: UIView in view.subviews {
            if subView.isFirstResponder {
                return subView
            }
        }
        return nil
    }
    
    private func globalResignFirstResponderRec(_ view: UIView) {
        if view.responds(to: #selector(self.resignFirstResponder)) {
            view.resignFirstResponder();
        }
        for subview: UIView in view.subviews {
            globalResignFirstResponderRec(subview);
        }
    }
    
    func globalResignFirstResponder() {
        globalResignFirstResponderRec(view);
        UIApplication.shared.keyWindow?.endEditing(true);
    }
    
}
