//
//  NSUserDefaults+Subscript.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/14/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    subscript (key: String)->AnyObject? {
        get {
            return self.value(forKey: key) as AnyObject?;
        }
        set {
            self.setValue(newValue, forKey: key);
        }
    }
    
}
