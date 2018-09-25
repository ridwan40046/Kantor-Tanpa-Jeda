//
//  String+Contains.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 3/20/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func contains (substring: String, caseSensitive: Bool = false)->Bool {
        if caseSensitive { return self.range(of:substring) != nil; }
        else { return self.lowercased().range(of:substring.lowercased()) != nil; }
    }
    
}
