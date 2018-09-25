//
//  UIView+IsVisible.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 17/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var isVisible: Bool {
        get {
            return !isHidden;
        }
        set {
            isHidden = !newValue;
        }
    }
    
}
