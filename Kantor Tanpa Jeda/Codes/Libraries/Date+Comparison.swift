//
//  Date+Comparison.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/6/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    var isExpired: Bool { return self < Date(); }
    
}
