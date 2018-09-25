//
//  Dictionary+JSON.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 4/4/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Dictionary {
    
    var jsonData : Data? {
        get {
            do { return try JSONSerialization.data(withJSONObject: self, options: []); }
            catch { print("\n\n\nJSON error: \(error.localizedDescription)"); return nil; }
        }
    }
}

extension Data {
    
    var json : [String: Any]? {
        do { return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any]; }
        catch { print("\n\n\nJSON error: \(error.localizedDescription)"); return nil; }
    }
    
    var string : String? {
        return String(data: self, encoding: String.Encoding.utf8)?.replacingOccurrences(of: "\\", with: "").replacingOccurrences(of: "\"", with: "");}
}
