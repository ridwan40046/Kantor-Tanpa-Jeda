//
//  UIViewController+Popup.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 26/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showPopup(_ view: UIView?) {
        guard let view = view else { return; }
        let base = UIApplication.shared.keyWindow;
        var shade : UIView! = self.view.view(93812)
        if shade == nil {
            shade = UIView.init(frame: UIScreen.main.bounds);
            shade.backgroundColor = UIColor.black;
            shade.alpha = 0;
            shade.tag = 93812;
            base?.addSubview(shade);
            shade.addTapGestureRecognizer(self, action: #selector(dismissPopup));
            shade.animateAppear(alpha: 0.5);
        }
        view.alpha = 0;
        view.width = min (view.width, UIScreen.width * 0.9);
        let top = self.navigationController?.navigationBar.bottom ?? 22;
        view.height = min (view.height, (UIScreen.height - top) * 0.9);
        view.center = CGPoint.init(x: UIScreen.width / 2, y: (UIScreen.height + top) / 2);
        view.tag = 89138;
        if let oldView = self.view.view(89138) {
            if oldView == view { return; }
            oldView.animateDisappearToRemove() {
                base?.addSubview(view);
                view.animateAppear();
            }
        }
        else {
            base?.addSubview(view);
            view.animateAppear();
        }
    }
    
    @IBAction func dismissPopup() {
        let base = UIApplication.shared.keyWindow;
        base?.view(93812)?.animateDisappearToRemove();
        base?.view(89138)?.animateDisappearToRemove();
    }
    
}


