//
//  UIColor+Constants.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 9/28/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /** The color of a tooltip */
    static var yellowPale : UIColor { return UIColor.init(red: 1, green: 1, blue: 202.0/255.0, alpha: 1); }
    static var greenButton : UIColor { return UIColor.init(red: 124.0/255.0, green: 191.0/255.0, blue: 49.0/255.0, alpha: 1); }
    static var grayButton : UIColor { return UIColor.init(rgbHex: 0xCCCCCC); }
    static var redBackground : UIColor { return UIColor.init(red: 239.0/255.0, green: 0, blue: 2.0/255.0, alpha: 1); }
    static func white(opacity: CGFloat) -> UIColor { return UIColor.init(red: 1, green: 1, blue: 1, alpha: opacity); }
    
    static var gold : UIColor { return UIColor.init(rgbHex: 0xFFD700); }
    static var goldenYellow : UIColor { return UIColor.init(rgbHex: 0xFFDF00); }
    static var metallicGold : UIColor { return UIColor.init(rgbHex: 0xD4AF37); }
    static var oldGold : UIColor { return UIColor.init(rgbHex: 0xCFB53B); }
    static var vegasGold : UIColor { return UIColor.init(rgbHex: 0xC5B358); }
    static var goldenBrown : UIColor { return UIColor.init(rgbHex: 0x996515); }
}
