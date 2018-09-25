//
//  UIView+RoundedRect.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 8/4/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
//    func makeRoundedRect(withCornerRadius cornerRadius: CGFloat) {
//        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0);
//        let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: cornerRadius);
//        path.addClip();
//        self.image?.draw(in: self.bounds);
//        let finalImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self.image = finalImage;
//        self.clipsToBounds = true;
////        [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius] addClip];
////        [self.image drawInRect:self.bounds];
////        UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
////        UIGraphicsEndImageContext();
////        
////        self.image = finalImage;
//
//    }

    func makeRoundedRect(withCornerRadius cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius;
        self.clipsToBounds = true;
    }
    
    open func makeRounded() {
        let corner = min (self.frame.size.width, self.frame.size.height) / 2;
        self.makeRoundedRect(withCornerRadius: corner);
    }
    
    func makeNonRounded() {
        self.layer.cornerRadius = 0;
    }
    
}
