//
//  UIResponder+FirstResponder.swift
//  Family Tree
//
//  Created by Martin Tjandra on 4/3/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

// Example Usage:
// if let textField = UIResponder.firstResponder as? UITextField {
//     print(textField.text ?? "")
// }
private var firstResponderRef: UIResponder? = nil

extension UIResponder {
    static var firstResponder: UIResponder? {
        get {
            firstResponderRef = nil
            // The trick here is, that the selector will be invoked on the first responder
            UIApplication.shared.sendAction(#selector(setFirstResponderRef), to: nil, from: nil, for: nil)
            return firstResponderRef
        }
    }
    
    @objc private func setFirstResponderRef() {
        firstResponderRef = self
    }
}
