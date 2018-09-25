//
//  String+Trim.swift
//  FamilyTree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation

extension String {
    
    /** Erase all leading and trailing whitespaces */
    func trim() -> String { return self.trimmingCharacters(in: .whitespacesAndNewlines); }
    
}
