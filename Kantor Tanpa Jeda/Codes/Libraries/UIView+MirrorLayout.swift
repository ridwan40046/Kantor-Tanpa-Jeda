//
//  UIView+MirrorLayout.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 17/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func mirrorLayout() {
        if let totalWidth = self.superview?.width {
            self.width = totalWidth - self.x * 2;
        }
    }

    func absMirrorLayout() {
        self.width = UIScreen.width - self.x * 2;
    }

}
