//
//  UIViewController+Positioning.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 08/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var contentBounds : CGRect {
        let top = self.navigationController?.navigationBar.bottom ?? 22;
        return CGRect.init(x: 0, y: top, width: UIScreen.width, height: UIScreen.height - top);
    }
    
}
