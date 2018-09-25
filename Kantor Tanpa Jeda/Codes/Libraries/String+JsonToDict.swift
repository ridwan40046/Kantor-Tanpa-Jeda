//
//  String+JsonToDict.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 1/18/18.
//  Copyright © 2018 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {

    var jsonToDict : [String: AnyObject]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            } catch {
                print("STRING JSON TO DICT CONVERSION ERROR : \(error.localizedDescription)");
            }
        }
        return nil
    }

    var jsonToArr : [AnyObject]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject]
            } catch {
                print("STRING JSON TO ARR CONVERSION ERROR : \(error.localizedDescription)");
            }
        }
        return nil
    }
    
    
}
