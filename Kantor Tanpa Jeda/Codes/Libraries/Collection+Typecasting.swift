//
//  Collection+Typecasting.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 26/06/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Collection where Indices.Iterator.Element == Int {
    
    var arrString : [String] { return self.map { return String($0 as! Indices.Iterator.Element); } }
    
}

extension Collection where Indices.Iterator.Element == Double {
    
    var arrString : [String] { return self.map { return String($0 as! Indices.Iterator.Element); } }
    
}

extension Collection where Indices.Iterator.Element == CGFloat {
    
    var arrString : [String] { return self.map { return "\($0 as! Indices.Iterator.Element)"; } }
    
}

extension Collection where Indices.Iterator.Element == Float {
    
    var arrString : [String] { return self.map { return String($0 as! Indices.Iterator.Element); } }
    
}

extension Collection where Indices.Iterator.Element == String {
    
    var arrInt : [Int] { return self.compactMap { return Int($0 as! Indices.Iterator.Element); } }
    var arrDouble : [Double] { return self.compactMap { return Double($0 as! Indices.Iterator.Element); } }
    var arrCGFloat : [CGFloat] { return self.compactMap { if let d = Double($0 as! Indices.Iterator.Element) { return CGFloat(d); } else { return nil; } } }
    var arrFloat : [Float] { return self.compactMap { return Float($0 as! Indices.Iterator.Element); } }

}

extension Collection {
    
    var arrInt : [Int] { return self.compactMap { return $0 as? Int; } }
    var arrDouble : [Double] { return self.compactMap { return $0 as? Double; } }
    var arrCGFloat : [CGFloat] { return self.compactMap { return $0 as? CGFloat; } }
    var arrFloat : [Float] { return self.compactMap { return $0 as? Float; } }
    var arrString : [String] { return self.compactMap { return "\($0)"; } }

}

