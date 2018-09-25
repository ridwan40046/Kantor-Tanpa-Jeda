//
//  Dictionary+RemovingOptionals.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/19/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary where Key == String, Value == Any? {
    
    func removingOptionals() -> [Key:Any] {
        var result = [Key:Any]();
        self.forEach({ (key, value) in if let v = value { result[key] = v; } });
        return result;
    }
    
}

extension Dictionary where Key == String, Value == AnyObject? {
    
    func removingOptionals() -> [Key:AnyObject] {
        var result = [Key:AnyObject]();
        self.forEach({ (key, value) in if let v = value { result[key] = v; } });
        return result;
    }
    
}

extension Dictionary where Key == String, Value == String? {
    
    func removingOptionals() -> [Key:String] {
        var result = [Key:String]();
        self.forEach({ (key, value) in if let v = value { result[key] = v; } });
        return result;
    }
    
}
