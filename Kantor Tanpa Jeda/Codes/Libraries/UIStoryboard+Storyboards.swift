//
//  UIStoryboard+Storyboards.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 6/2/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static var storyboards : [UIStoryboard] {
        let directory = Bundle.main.resourcePath! + "/Base.lproj"
        let allResources = try! FileManager.default.contentsOfDirectory(atPath: directory)
        let storyboardFileNames = allResources.filter({ $0.hasSuffix(".storyboardc" )})
        let storyboardNames = storyboardFileNames.map({ ($0 as NSString).deletingPathExtension as String })
        let storyboardArray = storyboardNames.map({ UIStoryboard(name: $0, bundle: Bundle.main )})
        return storyboardArray;
    }
    
    func instantiateViewControllerSafe(withIdentifier identifier: String) -> UIViewController? {
        if let availableIdentifiers = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
            if availableIdentifiers[identifier] != nil {
                return self.instantiateViewController(withIdentifier: identifier)
            }
        }
        return nil
    }
    
}
