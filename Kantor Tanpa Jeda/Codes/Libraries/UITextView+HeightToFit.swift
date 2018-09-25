//
//  UITextView+HeightToFit.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/5/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    func heightToFit () {
        var framex = frame
        if text == nil || (text! == "") { text = "T"; sizeToFit(); text = ""; }
        else { sizeToFit(); }
        framex.origin.x = frame.origin.x
        framex.origin.y = frame.origin.y
        framex.size.height = frame.size.height
        frame = framex
    }
    
    func getPerfectHeight (forText: String? = nil)->CGFloat {
        // saving the original
        let oriFrame = frame
        let oriText = text;
        
        // setting up the scenario
        var framex = frame
        framex.size.height = CGFloat.greatestFiniteMagnitude;
        frame = framex;
        text = forText ?? text;
        
        // get the height
        heightToFit();
        let perfectHeight: CGFloat = frame.size.height
        
        // restore the original
        frame = oriFrame
        text = oriText;
        
        // return the result
        return perfectHeight;
    }
    
    func getHeightDiff (forText: String?)->CGFloat {
        return getPerfectHeight(forText: forText) - height;
    }
}
