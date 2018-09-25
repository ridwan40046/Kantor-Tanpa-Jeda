//
//  RawRepresentable+Optional.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/28/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

// This enable Swift to instantiate enumeration from optional value

extension RawRepresentable {
    
    init?(rawData: RawValue?) {
        guard let rawData = rawData else { return nil }
        self.init(rawValue: rawData)
    }
    
}
