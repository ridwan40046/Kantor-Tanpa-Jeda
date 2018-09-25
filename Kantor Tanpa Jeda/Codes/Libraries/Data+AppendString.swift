//
//  Data+AppendString.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 24/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    
    mutating func appendString (_ data: String?) {
        guard let data = data?.data(using: .utf8) else { return; }
        self.append(data);
    }
    
}
