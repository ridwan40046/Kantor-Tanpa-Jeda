//
//  UIViewController+RemoveFromStack.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 13/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func removeFromStack(afterDelay : TimeInterval = 0.5) {
        delay (afterDelay) { self.navigationController?.remove(viewController: self); }
    }
    
}
