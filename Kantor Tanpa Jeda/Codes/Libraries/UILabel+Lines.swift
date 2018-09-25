//
//  UILabel+Lines.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 6/22/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    var numberOfLinesVisible : CGFloat {
        set {
            if newValue <= 0 { self.heightToFit(); }
            else {
                let lineHeight = self.font.lineHeight;
                self.height = lineHeight * newValue; }
        }
        get {
            return self.frame.size.height / self.font.lineHeight;
        }
    }
    
    private var fullHeight : CGFloat {
        let oriFrame = self.frame;
        self.height = CGFloat.greatestFiniteMagnitude;
        self.heightToFit();
        let fullHeight = self.height;
        self.frame = oriFrame;
        return fullHeight;
    }
    
    var numberOfLinesTotal : Int {
        let res = self.fullHeight/self.font.lineHeight
        return Int(res);
    }
    
    func numberOfLines (forText: String?)->Int {
        let oriText = self.text;
        self.text = forText;
        let lines = numberOfLinesTotal;
        self.text = oriText;
        return lines;
    }
    
}
