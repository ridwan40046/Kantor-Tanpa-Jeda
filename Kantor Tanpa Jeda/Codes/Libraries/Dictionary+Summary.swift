//
//  Dictionary+Summary.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 7/3/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    
    var compactSummary : String {
        return "\n" + self.map { key, value in
            if let key = key as? String {
                var type = "";
                if let _ = value as? Int { type = "i"; }
                else if let _ = value as? CGFloat { type = "f"; }
                else if let _ = value as? String { type = "s"; }
                else if let v = value as? Dictionary { type = "d\(v.keys.count)"; }
                else if let v = value as? Array<Any> { type = "a\(v.count)"; }
                else if let _ = value as? Bool { type = "b"; }
                else { type = "unknown"; }
                return "\(key.uppercased())/\(type)";
            }
            return "- \(key): \(value)";
        }.joined(separator: ", ") + "\n";
    }
    
    func summary(showKeysInsideDict: Bool = true) -> String {
        return "\n" + self.map { key, value in
            var content = "";
            if let key = key as? String {
                if let v = value as? Int { content = "\(v) (numeric)"; }
                else if let v = value as? CGFloat { content = "\(v) (float)"; }
                else if let v = value as? Double { content = "\(v) (double)"; }
                else if let v = value as? String { content = "\"\(v)\" (string)";
                    let triggerWords = ["AUTHORIZATION", "REFRESH_TOKEN", "ACCESS_TOKEN"];
                    if triggerWords.contains(key.uppercased()) { content = "\"\(v.cutOff(max: 30, hardCut: true))\" (string)"; }
                }
                else if let v = value as? Dictionary<String, AnyObject> {
                    content = "dict \(v.keys.count) keys";
                    if showKeysInsideDict { content = "\(content) [\(v.keys.joined(separator: ", "))]"; }
                }
                else if let v = value as? Array<Any> { content = "array \(v.count) element"; }
                else if let v = value as? Bool { content = "\(v) (boolean)"; }
                else { content = "\(value) (unknown)"; }
                return "- \(key.uppercased().padding(minCount: 10)): \(content)";
//                return "- \(key.uppercased().padding(minCount: 10)): \(content)";
            }
            return "- \(key): \(value)";
        }.joined(separator: ",\n") + "\n";
        
    }
    
    var summary : String { return summary(); }
    
    var postmanBulkEdit : String {
        return "\n" + self.map { key, value in return "\(key):\(value)" }.joined(separator: "\n");
    }
    
}
