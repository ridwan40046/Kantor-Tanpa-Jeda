//
//  String+Padding.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 7/3/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func padding (minCount: Int, withPad: String = " ") -> String {
        var res = self;
        while res.count < minCount { res += " "; }
        return res;
    }
    
}
