//
//  String+Data.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 24/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var dataUtf8: Data { return self.data(using: .utf8)!; }
    
}
