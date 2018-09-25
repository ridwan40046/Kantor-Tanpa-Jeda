//
//  UIView+Animate.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 9/25/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static func animate (withDuration: TimeInterval, delay: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        self.animate(withDuration: withDuration, delay: delay, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: animations, completion: completion);
    }
    
    func animateShake (withDuration: TimeInterval = 0.03, repeatCount: Float = 4) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = withDuration;
        animation.repeatCount = repeatCount;
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
    
    func animateJump (withDuration: TimeInterval = 0.05, scaledBy: CGFloat = 1.3) {
        let curTransform = self.transform;
        UIView.animate(withDuration: withDuration, delay: 0, options: [.autoreverse], animations: {
            self.transform = CGAffineTransform.init(scaleX: scaledBy, y: scaledBy);
        }) { (done) in
            self.transform = curTransform;
        }
    }
    
    func animateFlash (withDuration: TimeInterval = 0.3, color: UIColor = UIColor.gray) {
        let oriColor = self.backgroundColor;
        self.backgroundColor = color
        UIView.animate(withDuration: withDuration) {
            self.backgroundColor = oriColor;
        }
    }
    
    func animateDisappearToRemove (withDuration: TimeInterval = 0.3, callback: (()->Void)? = nil) {
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 0;
        }) { done in
            self.removeFromSuperview();
            callback?();
        }
    }
    
    func animateDisappearToHidden (withDuration: TimeInterval = 0.3, callback: (()->Void)? = nil) {
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 0;
        }) { done in
            self.isHidden = true;
            callback?();
        }
    }
    
    func animateAppear (withDuration: TimeInterval = 0.3, alpha: CGFloat = 1, callback: (()->Void)? = nil) {
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = alpha;
        }) { done in
            callback?();
        }
    }
    
    func animateGreenCheck (withDuration: (fadeIn: TimeInterval, persist: TimeInterval, fadeOut: TimeInterval) = (fadeIn: 0.1, persist: 1, fadeOut: 0.3), callback: (()->Void)? = nil) {
        let lbl = UILabel.init(frame: self.bounds);
        lbl.font = UIFont.fontAwesome(size: 30);
        lbl.textAlignment = .center;
        lbl.backgroundColor = UIColor.green;
        lbl.textColor = UIColor.white;
        lbl.text = "";
        lbl.alpha = 0;
        self.addSubview(lbl);
        lbl.animateAppear(withDuration: withDuration.fadeIn) {
            lbl.alpha = 1;
            delay(withDuration.persist) {
                lbl.animateDisappearToRemove(withDuration: withDuration.fadeOut) {
                    lbl.removeFromSuperview();
                    callback?();
                }
            }
        }
    }
}
