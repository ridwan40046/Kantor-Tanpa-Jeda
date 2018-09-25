//
//  UICollectionView+IndexPath.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/27/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func exists(indexPath:IndexPath) -> Bool {
        if indexPath.section >= self.numberOfSections { return false }
        if indexPath.row >= self.numberOfItems(inSection: indexPath.section) { return false }
        return true
    }

    func indexPath (for view: UIView?) -> IndexPath? {
        guard let cell = view?.parentCollectionViewCell else { return nil; }
        return indexPath(for: cell)
    }
    
    func sectionNumber (for view: UIView?) -> Int? {
        guard let view = view else { return nil; }
        for i in 0..<numberOfSections {
            if let header = supplementaryView(forElementKind: UICollectionElementKindSectionHeader, at: IndexPath.init(row: 0, section: i)) { // might be broken
                if header == view { return i; }
                if view.isDescendant(of: header) { return i; }
            }
        }
        return nil;
    }
}
