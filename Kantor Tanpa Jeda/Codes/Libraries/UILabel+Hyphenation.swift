//
//  UILabel+Hyphenation.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 02/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func hyphenate() {
        let paragraphStyle = NSMutableParagraphStyle()
        let attstr = NSMutableAttributedString(attributedString: self.attributedText!)
        paragraphStyle.hyphenationFactor = 1.0
        attstr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(0..<attstr.length))
        self.attributedText = attstr
    }
    
}
