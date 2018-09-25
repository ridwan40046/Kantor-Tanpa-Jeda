//
//  UIImageView+ResizeProportionally.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 12/14/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func heightToFit() { height = image?.size.scaledHeight(forWidth: width) ?? height; }
    func widthToFit() { width = image?.size.scaledWidth(forHeight: height) ?? width; }
    
}
