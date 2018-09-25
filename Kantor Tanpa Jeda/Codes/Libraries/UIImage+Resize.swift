//
//  UIImage+Resize.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 12/15/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func resize(_ maxWidth: CGFloat?, _ maxHeight: CGFloat?)->UIImage? {
        guard let maxWidth = maxWidth, let maxHeight = maxHeight else { return self; }
        return resize(targetSize: CGSize(width: maxWidth, height: maxHeight));
    }
    
    func PNGRepresentation (targetFileSize: Int? = nil) -> Data? {
        guard let size = targetFileSize else { return UIImagePNGRepresentation(self); }
        var scale : CGFloat = 1;
        var resizeResult : UIImage? = self;
        var result = UIImagePNGRepresentation(resizeResult!);
        if (result?.count ?? 0) == 0 { return nil; }
        while size < result?.count ?? 0 {
            let count = result?.count ?? 0;
            if size < count / 3 { scale -= 0.5; }
            else if size < count / 2 { scale -= 0.3; }
            else { scale -= 0.1; }
            if scale == 0 { return nil; }
            resizeResult = self.resize(self.size.width * scale, self.size.height * scale)
            if resizeResult == nil { return nil; }
            result = UIImagePNGRepresentation(resizeResult!);
            if result == nil { return nil; }
            if (result?.count ?? 0) == 0 { return nil; }
        }
        return result;
    }
    
    func resize(targetSize: CGSize?)->UIImage? {
        guard let targetSize = targetSize else { return self; }
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if (widthRatio > heightRatio) {
            newSize = CGSize.init(width: size.width * heightRatio, height: size.height * heightRatio)
        }
        else { newSize = CGSize.init(width: size.width * widthRatio, height: size.height * widthRatio) }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height);
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage;
    }
    
}
