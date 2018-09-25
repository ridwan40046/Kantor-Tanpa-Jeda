//
//  BaseViewController.swift
//  FamilyTree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {                                                                                       
    
    var animatedDistance: Double = 0;
    var containerVc: UIViewController?;
    var listenerHandlers = [UInt](); // add handlers here to automatically deattach when vc destroyed
    var curFocusedView: UIView?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "ColorHeader.png"), for: .default)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "LogoText.png")
        imageView.image = image
        self.navigationItem.titleView = imageView
    //    self.navigationController?.navigationBar.barTintColor = UIColor.redBackground;
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.black;
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white];
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        self.view.traverse { (view) in
            if let tf = view as? UITextField, let superview = tf.superview, tf.tag < 1000 {
                if superview.height - tf.height < 2 {
                    superview.setBorderForForm();
                }
            }
            else if let tv = view as? UITextView, let superview = tv.superview {
                if superview.height - tv.height < 2 {
                    superview.setBorderForForm();
                }
            }
            else if let btn = view as? UIButton, let superview = btn.superview {
                superview.makeRoundedRect(withCornerRadius: 5);
            }
            else if let tv = view as? UITableView {
                tv.estimatedSectionHeaderHeight = 0;
                tv.estimatedSectionFooterHeight = 0;
                tv.estimatedRowHeight = 0;
            }
        }
    }
    
    func addAutoDismissKeyboard (view: UIView?) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view?.addGestureRecognizer(tap)
    }
    
    func textFieldDone () { // will be called when the user finish input using return key. should be overridden.
        
    }

    func setMainView (_ view: UIView?) {
        guard let view = view else { return; }
        for aView in self.view.subviews { if aView == view { return; } }
        self.view.subviews.forEach({ if $0.y < 100 && $0 != view { $0.alpha = 1; } })
        if self.navigationController != nil, let isHidden = self.navigationController?.isNavigationBarHidden,
            !isHidden {
            view.y = self.navigationController!.navigationBar.bottom;
            view.width = self.view.width;
        }
        view.y = 66;
        view.width = self.view.width;
        self.view.addSubview(view);
        view.alpha = 0;
        UIView.animate(withDuration: 0.3, animations: {
            self.view.subviews.forEach({ if $0.y < 100 && $0 != view { $0.alpha = 0; } })
            view.alpha = 1;
        }) { done in
            self.view.subviews.forEach({ if $0.y < 100 && $0 != view { $0.removeFromSuperview(); } })
        }
    }
    
    func getMainView() -> UIView? {
        for view in self.view.subviews { if view.y < 100 && view.width > 0 && view.height > 0 { return view; } }
        return nil;
    }
    
    var mainView : UIView? {
        set { setMainView(newValue); }
        get { return getMainView(); }
    }
    
    deinit {
        listenerHandlers.forEach { (handle) in req.forget(handle); }
    }
    
    
    
//    func setMainView (_ targetView: UIView?, transition: UIViewAnimationOptions = .transitionFlipFromRight) {
//
//        guard let targetView = targetView else { return; }
//        var curView : UIView!;
//        for aView in self.view.subviews {
//            print ("AVIEW : \(aView.frame)");
//            if aView == targetView { return; }
//            if aView.y < 100 && aView.width > 0 { curView = aView; }
//        }
//
//        if self.navigationController != nil, let isHidden = self.navigationController?.isNavigationBarHidden,
//            !isHidden {
//            targetView.y = self.navigationController!.navigationBar.bottom;
//            targetView.width = self.view.width;
//        }
//
//        if curView != nil {
//            let container = UIView(frame: CGRect.enclosing(rects: [curView.frame, targetView.frame]));
//            self.view.addSubview(container);
//            curView.x -= container.x;
//            curView.y -= container.y;
//            targetView.x -= container.x;
//            targetView.y -= container.y;
//            curView.removeFromSuperview();
//            container.addSubview(curView);
//
//            UIView.transition(from: curView, to: targetView, duration: 0.6, options: [transition, .showHideTransitionViews]) { done in
//
//                curView.removeFromSuperview();
//                targetView.removeFromSuperview();
//
//                curView.x -= container.x;
//                curView.y -= container.y;
//                targetView.x -= container.x;
//                targetView.y -= container.y;
//
//                self.view.addSubview(targetView);
//            }
//        }
//        else {
//            self.view.addSubview(targetView);
//        }
//    }
}
