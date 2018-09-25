//
//  UITableView+IndexPath.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/2/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UITableView
{
    func exists(indexPath:IndexPath) -> Bool {
        if indexPath.section >= self.numberOfSections { return false }
        if indexPath.row >= self.numberOfRows(inSection: indexPath.section) { return false }
        return true
    }
    
    func indexPath (for view: UIView?) -> IndexPath? {
        guard let cell = view?.parentTableViewCell else { return nil; }
        return indexPath(for: cell)
    }
    
    func sectionNumber (for view: UIView?) -> Int? {
        guard let view = view else { return nil; }
        for i in 0..<numberOfSections {
            if let header = headerView(forSection: i) { // header need to be registered first using nib
                if header == view { return i; }
                if view.isDescendant(of: header) { return i; }
            }
        }
        return nil;
    }
}
