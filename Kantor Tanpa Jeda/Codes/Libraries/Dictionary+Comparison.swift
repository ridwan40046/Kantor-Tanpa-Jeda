//
//  Dictionary+Comparison.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/7/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

public func == (lhs: [String: Any], rhs: [String: Any] ) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}
