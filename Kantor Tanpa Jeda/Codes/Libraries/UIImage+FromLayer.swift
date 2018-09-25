//
//  UIImage+FromLayer.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/9/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    static func from(layer: CALayer)->UIImage? {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage;
    }
    
    convenience init(layer: CALayer) {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        self.init(cgImage: outputImage!)
    }
    
}
