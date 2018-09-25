//
//  String+EmptyNullify.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 20/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /** Returns the string if it's not an empty string. Otherwise, nil. */
    var emptyNullify : String? {
        if self.trim().isEmpty { return nil; } else { return self; }
    }
    
}
