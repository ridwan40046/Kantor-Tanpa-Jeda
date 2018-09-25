//
//  Collection+Summary.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 7/3/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Collection {
    
    func summary(fullDictSummary: Bool = false) -> String {
        if let arr = self as? Array<Dictionary<String, AnyObject>> {
            if let el0 = arr[safe: 0] {
                if !fullDictSummary {
                    return "\nArray \(arr.count) elements of dictionary with keys: \(el0.compactSummary)";
                }
                else {
                    var text = "\nArray \(arr.count) elements of dictionary with summary:";
                    for (idx, el) in arr.enumerated() { text = "\nElement: \(idx)\(el.summary)"; }
                    return text;
                }
            }
            else {
                return "(Empty array)"
            }
        }
        else if let arr = self as? Array<AnyObject> {
            if let el0 = arr[safe: 0] {
                return "\nArray \(arr.count) elements of \(type(of: el0)): \n" + arr.enumerated().map({ return "[\($0)]: \($1)"}).joined(separator: "\n") + "\n";
            }
            else {
                return "(Empty array)"
            }
        }
        else {
            return "\n\(self)";
        }
    }
    
    var summary : String { return summary(); }
    
}
