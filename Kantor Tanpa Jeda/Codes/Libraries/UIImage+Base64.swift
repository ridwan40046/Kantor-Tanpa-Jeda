//
//  UIImage+Base64.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 8/3/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    var base64: String? {
        return UIImagePNGRepresentation(self)?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters);
    }
    
}

extension String {
    
    var image: UIImage? {
        var clean = self;
        clean = clean.replace("data:image/jpeg;base64,", with: "");
        guard let data = Data.init(base64Encoded: clean, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else { return nil; }
        return UIImage.init(data: data);
    }
    
}
