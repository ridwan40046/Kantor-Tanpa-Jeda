//
//  Dictionary+Merge.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/5/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    mutating func merge(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}

func + <K, V> (left: inout [K:V], right: [K:V]) -> [K:V] {
    var result = left;
    for (k, v) in right {
        result[k] = v
    }
    return result;
}
