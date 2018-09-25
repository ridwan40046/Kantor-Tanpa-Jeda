//
//  String+Replace.swift
//  FamilyTree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation

extension String {
    
    func replace (_ text: String, with: String) -> String {
        return replacingOccurrences(of: text, with: with);
    }
    
}
