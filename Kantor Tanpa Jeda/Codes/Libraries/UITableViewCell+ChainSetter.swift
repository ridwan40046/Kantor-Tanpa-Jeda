//
//  UITableViewCell+ChainSetter.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 9/20/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    @discardableResult
    func setLabel (_ tag: Int, with text: String?) -> UITableViewCell { label(tag)?.text = text; return self; }
    
    @discardableResult
    func setTextView (_ tag: Int, with text: String?, editMode: Bool?) -> UITableViewCell {
        setTextView(tag, with: text);
        setTextView(tag, editMode: editMode)
        return self;
    }
    
    @discardableResult
    func setTextView (_ tag: Int, with text: String?) -> UITableViewCell { textView(tag)?.text = text; return self; }
    
    @discardableResult
    func setTextView (_ tag: Int, editMode: Bool?) -> UITableViewCell {
        guard let editMode = editMode else { return self; }
        let tv = textView(tag);
        if editMode {
            tv?.setBorder(width: 1, color: UIColor.groupTableViewBackground);
            tv?.isUserInteractionEnabled = true;
        }
        else { tv?.removeBorder(); tv?.isUserInteractionEnabled = false; }
        
        return self;
    }
    
    @discardableResult
    func setTextField (_ tag: Int, with text: String?, placeholder: String?, editMode: Bool?) -> UITableViewCell {
        setTextField(tag, with: text);
        setTextField(tag, placeholder: placeholder);
        setTextField(tag, editMode: editMode);
        return self;
    }
    
    @discardableResult
    func setTextField (_ tag: Int, with text: String?) -> UITableViewCell { textField(tag)?.text = text; return self; }
    
    @discardableResult
    func setTextField (_ tag: Int, editMode: Bool?) -> UITableViewCell {
        guard let editMode = editMode else { return self; }
        let tf = textField(tag);
        if editMode {
            tf?.borderStyle = .roundedRect;
            tf?.isUserInteractionEnabled = true;
        }
        else {
            tf?.borderStyle = .none;
            tf?.isUserInteractionEnabled = false;
        }
        return self;
    }
    
    @discardableResult
    func setTextField (_ tag: Int, placeholder text: String?) -> UITableViewCell { textField(tag)?.placeholder = text; return self; }
    
    @discardableResult
    func setImage (_ tag: Int, with image: UIImage?) -> UITableViewCell { self.image(tag)?.image = image; return self; }

    @discardableResult
    func setButton (_ tag: Int, with title: String?, editMode: Bool?) -> UITableViewCell {
        setButton(tag, with: title);
        setButton(tag, editMode: editMode);
        return self;
    }

    @discardableResult
    func setButton (_ tag: Int, with title: String?) -> UITableViewCell {
        button(tag)?.setTitle(title, for: UIControlState.normal); return self; }
    
    @discardableResult
    func setButton (_ tag: Int, editMode: Bool?) -> UITableViewCell {
        guard let editMode = editMode else { return self; }
        button(tag)?.isUserInteractionEnabled = editMode;
        return self;
    }
    
    @discardableResult
    func setButtonImage (_ tag: Int, with image: UIImage?) -> UITableViewCell {
        self.button(tag)?.setImage(image, for: UIControlState.normal); return self; }
    
    enum SeparatorStyle { case full; case normal; case none; }
    @discardableResult
    func setSeparator (type: SeparatorStyle?) -> UITableViewCell { guard let type = type else { return self; }
        switch type {
        case .full:
            self.preservesSuperviewLayoutMargins = true;
            self.separatorInset = UIEdgeInsets.zero;
            self.layoutMargins = UIEdgeInsets.zero;
        case .none:
            self.separatorInset = UIEdgeInsets.init(top: 0, left: 10000, bottom: 0, right: 0);
        case .normal: break;
        }
        return self;
    }
    
    @discardableResult
    func setHidden (_ tag: Int, to bool: Bool) -> UITableViewCell {
        self.view(tag)?.isHidden = bool; return self;
    }
    
}
