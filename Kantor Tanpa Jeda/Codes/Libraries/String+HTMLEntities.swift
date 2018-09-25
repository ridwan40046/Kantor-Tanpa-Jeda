//
//  String+HTMLEntities.swift
//  toiletfeedback
//
//  Created by Martin Tjandra on 7/12/17.
//  Copyright © 2017 idesolusi. All rights reserved.
//

import Foundation

extension String {
    
    var escaped : String {
        return self.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? self;
    }
    
}
