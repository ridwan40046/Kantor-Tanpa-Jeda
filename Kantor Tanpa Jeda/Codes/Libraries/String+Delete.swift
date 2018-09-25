//
//  String+Delete.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 1/9/18.
//  Copyright © 2018 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    mutating func delete (text: String) {
        self = self.replace(text, with: "");
    }
    
}
