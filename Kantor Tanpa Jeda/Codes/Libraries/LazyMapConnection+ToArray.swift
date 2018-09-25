//
//  LazyMapConnection+ToArray.swift
//  LearnFlux
//
//  Created by ISA on 1/11/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

public extension LazyMapCollection  {
    
    func toArray() -> [Element]{
        return Array(self)
    }
}
