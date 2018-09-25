//
//  String+Remove.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 02/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var removingLineBreaks : String {
        return String(self.filter { !"\n\t\r".contains($0) });
    }
    
}
