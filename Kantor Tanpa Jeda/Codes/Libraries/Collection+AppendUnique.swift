//
//  Collection+AppendUnique.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/2/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    @discardableResult
    mutating func appendIfNew(_ element: Element) -> Bool {
        if !contains(element) { append(element); return true; }
        return false;
    }
    
}
