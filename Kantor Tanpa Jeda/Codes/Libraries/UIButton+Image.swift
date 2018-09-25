//
//  UIButton+Image.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 1/12/18.
//  Copyright © 2018 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    /** Shortcut for setting / getting image to control state normal */
    var image : UIImage? {
        get { return self.image(for: UIControlState.normal); }
        set { self.setImage(newValue, for: UIControlState.normal); }
    }
    
}
