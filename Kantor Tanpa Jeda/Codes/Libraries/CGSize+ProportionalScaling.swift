//
//  CGSize+ProportionalScaling.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 12/14/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    
    func scaledHeight (forWidth: CGFloat) -> CGFloat { return height / width * forWidth; }
    func scaledWidth (forHeight: CGFloat) -> CGFloat { return width / height * forHeight; }
    
}
