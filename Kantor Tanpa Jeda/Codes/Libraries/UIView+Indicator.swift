//
//  UIView+Indicator.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 8/30/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

enum ScreenIndicatorType {
    case roundedRect;
}

extension UIView {
    
    enum IndicatorPosition { case midLeft; case center; case midRight; }
    
//    func addIndicator (position: IndicatorPosition = .center) {
//        if self.view(48273) != nil { return; }
//        let v = UIView();
//        v.backgroundColor = UIColor.clear;
//        v.tag = 48273;
//        self.superview?.addSubview(v);
//        v.frame = self.frame;
//
//        let indicator = UIActivityIndicatorView();
//        v.addSubview(indicator);
////        print ("VIEW X = \(v.x), Y = \(v.y), WIDTH = \(v.width), HEIGHT = \(v.height)");
////        let s = UIScreen.main.bounds;
////        print ("SCREEN WIDTH = \(s.width), HEIGHT = \(s.height)")
//        indicator.x = v.width / 2;
//        if self is UIButton { indicator.x = self.width - indicator.width - 20; }
//        indicator.y = v.height / 2;
//        indicator.color = UIColor.black;
//        switch position {
//        case .midLeft: indicator.x = v.x + 20;
//        case .center: break;
//        case .midRight: indicator.x = v.x + v.width - indicator.width - 20;
//        }
//        indicator.startAnimating();
//
//    }
//
//    func removeIndicator (recursive: Bool = false) {
//        while let v = self.superview?.view(48273) { v.removeFromSuperview(); }
////        self.superview?.subviews.forEach { if $0.tag == 48273 { $0.removeFromSuperview(); } }
////        if recursive { self.subviews.forEach { $0.removeIndicator(recursive: recursive); } }
//    }
    
    func addScreenIndicator (fromSuperview: Bool = false, type: ScreenIndicatorType = .roundedRect) {
        if self.view(48273) != nil { return; }
        let v = UIView();
        v.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5);
        v.tag = 48273;
        if fromSuperview {
            self.superview?.addSubview(v);
            v.frame = self.frame;
        }
        else {
            self.addSubview(v);
            v.frame = self.bounds;
        }
        v.autoresizingMask = [.flexibleBottomMargin, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleWidth];
        
        let sub = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 100));
        sub.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5);
        sub.center = v.bounds.center;
        sub.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin];
        sub.makeRoundedRect(withCornerRadius: 5);
        v.addSubview(sub);
        
        let lbl = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 50));
        lbl.textAlignment = .center;
        lbl.font = UIFont.systemFont(ofSize: 17);
        lbl.textColor = UIColor.white;
        lbl.text = "Requesting...";
        sub.addSubview(lbl);
        
        let indicator = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20));
        indicator.center = sub.bounds.center;
        indicator.y += sub.height / 5;
        indicator.color = UIColor.white;
        indicator.startAnimating();
        sub.addSubview(indicator);

//        print ("INDICATOR X = \(indicator.x), Y = \(indicator.y), WIDTH = \(indicator.width), HEIGHT = \(indicator.height)");
        
        v.alpha = 0;
        sub.alpha = 0;
        sub.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5);
        UIView.animate(withDuration: 0.5) { v.alpha = 1; sub.transform = CGAffineTransform.identity; sub.alpha = 1; }
    }
    
    func addIndicator (position: IndicatorPosition = .center, fromSuperview: Bool = false, addShade: Bool = true) {
        if self.view(48273) != nil { return; }
        let v = UIView();
        v.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: addShade ? 0.5 : 0);
        v.tag = 48273;
        if fromSuperview {
            self.superview?.addSubview(v);
            v.frame = self.frame;
        }
        else {
            self.addSubview(v);
            v.frame = self.bounds;
        }
        v.autoresizingMask = [.flexibleHeight, .flexibleWidth];
        
        let indicator = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20));
        v.addSubview(indicator);
        indicator.center = v.center;
//                print ("VIEW X = \(v.x), Y = \(v.y), WIDTH = \(v.width), HEIGHT = \(v.height)");
        //        let s = UIScreen.main.bounds;
        //        print ("SCREEN WIDTH = \(s.width), HEIGHT = \(s.height)")
        if self is UIButton { indicator.x = v.width - indicator.width - 20; }
        indicator.color = UIColor.black;
        switch position {
        case .midLeft: indicator.x = v.x + 20;
        case .center: break;
        case .midRight: indicator.x = v.x + v.width - indicator.width - 20;
        }
        indicator.startAnimating();
        print ("INDICATOR X = \(indicator.x), Y = \(indicator.y), WIDTH = \(indicator.width), HEIGHT = \(indicator.height)");

        v.alpha = 0;
        UIView.animate(withDuration: 0.5) { v.alpha = 1; }
    }
    
    func removeIndicator (recursive: Bool = true) {
        guard let v = self.superview?.view(48273) else { return; }
        UIView.animate(withDuration: 0.1, animations: { v.alpha = 0; }) { done in
            v.removeFromSuperview();
            if recursive { while let v = self.superview?.view(48273) { v.removeFromSuperview(); } }
            //        self.superview?.subviews.forEach { if $0.tag == 48273 { $0.removeFromSuperview(); } }
            //        if recursive { self.subviews.forEach { $0.removeIndicator(recursive: recursive); } }
        }
        
    }
    
}
