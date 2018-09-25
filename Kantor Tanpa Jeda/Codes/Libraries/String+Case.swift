//
//  String+Case.swift
//  iOPS
//
//  Created by Martin Tjandra on 9/5/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    var snake: String {
        var result = "";
        for i in 0..<self.count {
            let ch = String(self[self.index(self.startIndex, offsetBy: i)]);
            if ch.lowercased() != ch { result += "_" }
            result += ch.lowercased();
        }
        return result;
    }
    
    var camel: String {
        var result = ""
        let items = self.components(separatedBy: "_");
        items.enumerated().forEach {
            result += ((0 == $0.offset) ? $0.element : $0.element.capitalized)
        }
        return result
    }
    
}
