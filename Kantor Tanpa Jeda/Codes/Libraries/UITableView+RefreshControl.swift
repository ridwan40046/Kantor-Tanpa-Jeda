//
//  UITableView+RefreshControl.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 12/07/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    @discardableResult
    func addRefreshControl (_ target: Any, action: Selector) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: action, for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.gray;
        self.refreshControl = refreshControl;
        return refreshControl
    }
    
}
