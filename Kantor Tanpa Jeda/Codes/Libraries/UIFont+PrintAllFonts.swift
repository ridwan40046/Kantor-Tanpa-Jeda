//
//  UIFont+PrintAllFonts.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 12/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func printAllFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)\n")
        }
    }
    
}
