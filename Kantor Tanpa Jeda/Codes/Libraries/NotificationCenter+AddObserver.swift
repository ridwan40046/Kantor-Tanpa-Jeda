//
//  NotificationCenter+AddObserver.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/14/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension NotificationCenter {
    
    open func addObserver(_ observer: Any?, selector: Selector?, name: String?, object: Any? = nil) {
        guard let observer = observer, let selector = selector, let name = name else { return; }
        addObserver(observer, selector: selector, name: NSNotification.Name(name), object: object);
    }

    static open func addObserver(_ observer: Any?, selector: Selector?, name: String?, object: Any? = nil) {
        guard let observer = observer, let selector = selector, let name = name else { return; }
        self.default.addObserver(observer, selector: selector, name: NSNotification.Name(name), object: object);
    }
    
}

func addObserver(_ observer: Any?, selector: Selector?, name: String?, object: Any? = nil) {
    guard let observer = observer, let selector = selector, let name = name else { return; }
    NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(name), object: object);
}
