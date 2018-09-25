//
//  UINavigationController+RemoveViewController.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 11/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func remove(viewController: UIViewController) {
        var stack = self.viewControllers;
        var i = 0;
        while i < stack.count {
            if stack[i] == viewController {
                stack.remove(at: i);
            }
            else {
                i += 1;
            }
        }
        self.viewControllers = stack;
    }
    
    func remove(atIndex: Int) {
        var stack = self.viewControllers;
        if atIndex >= stack.count { return; }
        stack.remove(at: atIndex);
        self.viewControllers = stack;
    }
    
}
