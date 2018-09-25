//
//  UIImage+Hue.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/28/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

extension UIImage {
    
    /** Hue = 0 to 1.27 */
    func recolor(fixedHue: CGFloat, alpha: CGFloat) -> UIImage? {
        // Note: the hue input ranges from 0.0 to 1.0, both red.  Values outside this range will be clamped to 0.0 or 1.0.
        // Find the image dimensions.
        let imageSize = self.size
        let imageExtent = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        // Create a context containing the image.
        UIGraphicsBeginImageContext(imageSize)
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage else { return nil; }
        self.draw(at: CGPoint(x: 0, y: 0))
        // Setup a clip region using the image
        context.saveGState()
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.clip(to: imageExtent, mask: cgImage)
        //[[UIColor colorWithHue:hue saturation:1.0 brightness:1 alpha:alpha] set];
        context.fill(imageExtent)
        // Draw the hue on top of the image.
        context.draw (cgImage, in: imageExtent)
        context.setBlendMode(.hue)
        UIColor(hue: fixedHue, saturation: 1.0, brightness: 1, alpha: alpha).set()
        let imagePath = UIBezierPath(rect: imageExtent)
        imagePath.fill()
        context.restoreGState()
        // remove clip region
        // Retrieve the new image.
        let result: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result

    }
    
    func recolor (rotatedHue: CGFloat) -> UIImage? {
        // Create a Core Image version of the image.
        var sourceCore: CIImage?
        if let anImage = self.cgImage {
            sourceCore = CIImage(cgImage: anImage)
        }
        // Apply a CIHueAdjust filter
        let hueAdjust = CIFilter(name: "CIHueAdjust")
        hueAdjust?.setDefaults()
        hueAdjust?.setValue(sourceCore, forKey: "inputImage")
        hueAdjust?.setValue(rotatedHue, forKey: "inputAngle")
        let resultCore = hueAdjust?.value(forKey: "outputImage") as? CIImage
        // Convert the filter output back into a UIImage.
        // This section from http://stackoverflow.com/a/7797578/1318452
        let context = CIContext(options: nil)
        var resultRef: CGImage? = nil
        if let aCore = resultCore {
            resultRef = context.createCGImage(aCore, from: resultCore?.extent ?? CGRect.zero)
        }
        var result: UIImage?
        if let aRef = resultRef {
            result = UIImage(cgImage: aRef)
        }
        return result
    }

    
}
