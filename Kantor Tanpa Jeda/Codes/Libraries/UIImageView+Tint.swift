//
//  UIImageView+Tint.swift
//  Family Tree
//
//  Created by Martin Tjandra on 20/04/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setTintColor(_ tintColor: UIColor?) {
        guard let tintColor = tintColor else { return; }
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = tintColor;
    }
    
}
