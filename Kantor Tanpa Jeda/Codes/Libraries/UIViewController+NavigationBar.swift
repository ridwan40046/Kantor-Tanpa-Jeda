//
//  UIViewController+NavigationBar.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/5/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @discardableResult
    func setRightBarButton (title: String?, target: Any?, action: Selector?) -> UIBarButtonItem {
        let backButton = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: target, action: action);
        self.navigationItem.rightBarButtonItem = backButton;
        return backButton;
    }

    @discardableResult
    func setRightBarButton (image: UIImage? = UIImage(named: "menu"), target: Any?, action: Selector?) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal);
        button.frame = CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0)
        if let action = action { button.addTarget(target, action: action, for: .touchUpInside); }
        
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem;
        return barButtonItem
    }
    
    func removeRightBarButton () {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
    func removeBackBarButton () {
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
}
