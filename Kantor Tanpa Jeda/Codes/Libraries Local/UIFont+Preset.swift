//
//  UIFont+Preset.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/14/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

class FontName {
    var name: String;
    init(_ name: String) { self.name = name; }
    func withSize (_ size: CGFloat)->UIFont {
        return UIFont.init(name: self.name, size: size)!;
    }
    
}

//extension UIFont {
//    
//    static var appProximaNovaSemiBold : FontName { return FontName("ProximaNova-Semibold"); }
//    static var appProximaNovaThin : FontName { return FontName("ProximaNovaT-Thin"); }
//    static var appProximaNovaBold : FontName { return FontName("ProximaNovaA-Bold"); }
//    static var appProximaNovaRegular : FontName { return FontName("ProximaNovaA-Regular"); }
//    static var appProximaNovaBlack : FontName { return FontName("ProximaNovaA-Black"); }
//    static var appProximaNovaCondensedSemiBold : FontName { return FontName("ProximaNovaACond-Semibold"); }
//    static var appProximaNovaSuperThin : FontName { return FontName("ProximaNovaS-Thin"); }
//
//}
