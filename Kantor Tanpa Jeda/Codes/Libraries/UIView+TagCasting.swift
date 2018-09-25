//
//  UITableViewCell+TagCasting.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/22/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func image() -> UIImageView? { for v in subviews { if let d = v as? UIImageView { return d; } }; return nil; }
    func button() -> UIButton? { for v in subviews { if let d = v as? UIButton { return d; } }; return nil; }
    func label() -> UILabel? { for v in subviews { if let d = v as? UILabel { return d; } }; return nil; }
    func textField() -> UITextField? { for v in subviews { if let d = v as? UITextField { return d; } }; return nil; }
    func textView() -> UITextView? { for v in subviews { if let d = v as? UITextView { return d; } }; return nil; }
    func scrollView() -> UIScrollView? { for v in subviews { if let d = v as? UIScrollView { return d; } }; return nil; }
    func view() -> UIView? { for v in subviews { if v.isMember(of: UIView.self) { return v; } }; return nil; }
    func table() -> UITableView? { for v in subviews { if let d = v as? UITableView { return d; } }; return nil; }
    func datePicker() -> UIDatePicker? { for v in subviews { if let d = v as? UIDatePicker { return d; } }; return nil; }
    func `switch`() -> UISwitch? { for v in subviews { if let d = v as? UISwitch { return d; } }; return nil; }

    
    func image (_ tag: Int)->UIImageView? { return self.viewWithTag(tag) as? UIImageView; }
    func button (_ tag: Int)->UIButton? { return self.viewWithTag(tag) as? UIButton; }
    func label (_ tag: Int)->UILabel? { return self.viewWithTag(tag) as? UILabel; }
    func textField (_ tag: Int)->UITextField? { return self.viewWithTag(tag) as? UITextField; }
    func textView (_ tag: Int)->UITextView? { return self.viewWithTag(tag) as? UITextView; }
    func view (_ tag: Int)->UIView? { return self.viewWithTag(tag); }
    func scrollView (_ tag: Int)->UIScrollView? { return self.viewWithTag(tag) as? UIScrollView; }
    func table (_ tag: Int)->UITableView? { return self.viewWithTag(tag) as? UITableView; }
    func datePicker (_ tag: Int)->UIDatePicker? { return self.viewWithTag(tag) as? UIDatePicker; }
    func `switch` (_ tag: Int)->UISwitch? { return self.viewWithTag(tag) as? UISwitch; }

    func Image (_ tag: Int)->UIImageView { return self.viewWithTag(tag) as! UIImageView; }
    func Button (_ tag: Int)->UIButton { return self.viewWithTag(tag) as! UIButton; }
    func Label (_ tag: Int)->UILabel { return self.viewWithTag(tag) as! UILabel; }
    func TextField (_ tag: Int)->UITextField { return self.viewWithTag(tag) as! UITextField; }
    func TextView (_ tag: Int)->UITextView { return self.viewWithTag(tag) as! UITextView; }
    func ScrollView (_ tag: Int)->UIScrollView? { return self.viewWithTag(tag) as? UIScrollView; }
    func View (_ tag: Int)->UIView { return self.viewWithTag(tag)!; }
    func Table (_ tag: Int)->UITableView { return self.viewWithTag(tag) as! UITableView; }
    func DatePicker (_ tag: Int)->UIDatePicker { return self.viewWithTag(tag) as! UIDatePicker; }
    func `Switch` (_ tag: Int)->UISwitch { return self.viewWithTag(tag) as! UISwitch; }

    var Image: UIImageView {
        var res : UIImageView!;
        self.traverse { if let d = $0 as? UIImageView, res == nil { res = d; } }
        return res;
    }
    var Button: UIButton {
        var res : UIButton!;
        self.traverse { if let d = $0 as? UIButton, res == nil { res = d; } }
        return res;
    }
    var Label: UILabel {
        var res : UILabel!;
        self.traverse { if let d = $0 as? UILabel, res == nil { res = d; } }
        return res;
    }
    var TextField: UITextField {
        var res : UITextField!;
        self.traverse { if let d = $0 as? UITextField, res == nil { res = d; } }
        return res;
    }
    var TextView: UITextView {
        var res : UITextView!;
        self.traverse { if let d = $0 as? UITextView, res == nil { res = d; } }
        return res;
    }
    var ScrollView: UIScrollView {
        var res : UIScrollView!;
        self.traverse { if let d = $0 as? UIScrollView, res == nil { res = d; } }
        return res;
    }
    var Table: UITableView {
        var res : UITableView!;
        self.traverse { if let d = $0 as? UITableView, res == nil { res = d; } }
        return res;
    }
    var DatePicker: UIDatePicker {
        var res : UIDatePicker!;
        self.traverse { if let d = $0 as? UIDatePicker, res == nil { res = d; } }
        return res;
    }
    var `Switch`: UISwitch {
        var res : UISwitch!;
        self.traverse { if let d = $0 as? UISwitch, res == nil { res = d; } }
        return res;
    }

    
//    var imageRec : UIImageView? {
//
//        func search (view: UIView) -> UIImageView? {
//            for v in subviews {
//                if let result = v as? UIImageView { return result; }
//                else { if let result = search (view: v) { return result; } }
//            }
//            return nil;
//        }
//
//        return search(view: self);
//    }
//
//    var textViewRec : UITextView? {
//        var maxDepth = 7;
//
//        func search (view: UIView, depth: Int) -> UITextView? {
//            if depth >= maxDepth { return nil; }
//            for v in subviews {
//                if let result = v as? UITextView { return result; }
//                else { if let result = search (view: v, depth: depth + 1) { return result; } }
//            }
//            return nil;
//        }
//
//        return search(view: self, depth: 0);
//    }
}
