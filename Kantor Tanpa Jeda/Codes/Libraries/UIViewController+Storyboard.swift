//
//  UIViewController+Storyboard.swift
//  toiletfeedback
//
//  Created by Martin Tjandra on 2/17/17.
//  Copyright © 2017 idesolusi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func instantiate (named: String?, fromStoryboard: String? = nil) -> UIViewController? {
        guard let named = named else { return nil; }
        let named2 = named.capitalizingFirstLetter();
        if let sbName = fromStoryboard {
            let sb = UIStoryboard(name: sbName, bundle: nil);
            return sb.instantiateViewControllerSafe(withIdentifier: named) ??
                sb.instantiateViewControllerSafe(withIdentifier: named2)
        }
        else {
            let sbs = UIStoryboard.storyboards;
            for sb in sbs {
                let vc = sb.instantiateViewControllerSafe(withIdentifier: named) ??
                    sb.instantiateViewControllerSafe(withIdentifier: named2);
                if vc != nil { return vc; }
            }
        }
        return nil;
    }
}
