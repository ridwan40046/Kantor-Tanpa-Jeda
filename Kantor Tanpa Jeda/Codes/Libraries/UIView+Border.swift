//
//  UIView+Border.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 9/28/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setBorder (width: CGFloat?, color: UIColor?) {
        guard let width = width else { return; }
        self.layer.borderWidth = width;
        self.layer.borderColor = color?.cgColor;
    }
    
    func setBorder (width: CGFloat?, color: CGColor?) {
        guard let width = width else { return; }
        self.layer.borderWidth = width;
        self.layer.borderColor = color;
    }
    
    func removeBorder () { self.layer.borderWidth = 0; }
    
}
