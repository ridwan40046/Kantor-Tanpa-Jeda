//
//  NSObject+ClassName.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 6/14/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String { return NSStringFromClass(type(of: self)) }
}
