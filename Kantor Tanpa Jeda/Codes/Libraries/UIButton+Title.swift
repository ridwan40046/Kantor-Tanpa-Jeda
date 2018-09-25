//
//  UIButton+Title.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/27/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    var title : String? {
        get { return titleLabel?.text; }
        set { setTitle(newValue, for: .normal); }
    }
    
}
