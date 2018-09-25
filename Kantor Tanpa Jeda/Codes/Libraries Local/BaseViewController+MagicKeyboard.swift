//
//  BaseViewController+MagicKeyboard.swift
//  Family Tree
//
//  Created by Martin Tjandra on 1/31/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension BaseViewController : UITextFieldDelegate {
    
    // Magic keyboard
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        Util.animateSetFocus(self.containerVc ?? self, toView: textField, distance: &animatedDistance)
//        curFocusedView = textField;
        var v : UIView!;
        var useSuperview : Bool = false;
        if let superview = textField.superview, superview.height - textField.height < 2 { useSuperview = true;}
        if useSuperview { v = textField.superview!; } else { v = textField; }
        
        UIView.animateKeyframes(withDuration: 0.05, delay: 0, options: .autoreverse, animations: {
            v.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1);
            if useSuperview { /* v.setBorder(width: 1, color: UIColor.lightGray); */ }
        }) { done in
            v.transform = CGAffineTransform.identity;
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        Util.animateDismissSetFocus(self.containerVc ?? self, distance: &animatedDistance)
//        curFocusedView = nil;

//        if let superview = textField.superview, superview.height - textField.height < 2 { textField.superview?.setBorder(width: 1, color: UIColor.init(rgbHex: 0xeaeff2)); }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        if textField.tag != 0, let v = self.view.view(textField.tag + 1) {
            v.becomeFirstResponder();
        }
        else {
            dismissKeyboard();
            textFieldDone();
        }
        return false;
//        return true;
    }
    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension BaseViewController : UITextViewDelegate {
    
    // Magic keyboard
    func textViewDidBeginEditing(_ textView: UITextView) {
//        Util.animateSetFocus(self.containerVc ?? self, toView: textView, distance: &animatedDistance)
//        curFocusedView = textView;
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
//        Util.animateDismissSetFocus(self.containerVc ?? self, distance: &animatedDistance)
//        curFocusedView = nil;
    }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        if textView.tag != 0, let v = self.view.view(textView.tag + 1) {
            v.becomeFirstResponder();
        }
        else {
            dismissKeyboard();
            textFieldDone();
        }
        return false;
        //        return true;
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil);
    }

    @objc func keyboardWasShown (_ notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size;
        if self.curFocusedView != nil {
            let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
            if orientation == .portrait || orientation == .portraitUpsideDown {
                if Util.fixPortraitKeyboardHeight == keyboardSize.height { return; }
                else { Util.fixPortraitKeyboardHeight = keyboardSize.height; }
            }
            else {
                if Util.fixLandscapeKeyboardHeight == keyboardSize.height { return; }
                else { Util.fixLandscapeKeyboardHeight = keyboardSize.height; }
            }
            Util.animateDismissSetFocus(self.containerVc ?? self, distance: &animatedDistance);
            Util.animateSetFocus(self.containerVc ?? self, toView: self.curFocusedView!, distance: &self.animatedDistance);
        }
    }
}





