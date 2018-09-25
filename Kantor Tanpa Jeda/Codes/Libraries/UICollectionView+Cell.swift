//
//  UICollectionView+Cell.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/31/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func cell (_ name: String? = "cell", indexPath: IndexPath) -> UICollectionViewCell? {
        guard let name = name else { return nil; }
        return dequeueReusableCell(withReuseIdentifier: name, for: indexPath);
    }
    
    func cell (section: Int?, row: Int?) -> UICollectionViewCell? {
        guard let section = section, let row = row else { return nil; }
        return self.cellForItem(at: IndexPath(row: row, section: section));
    }
    
    func cell (indexPath: IndexPath?) -> UICollectionViewCell? {
        guard let indexPath = indexPath else { return nil; }
        return self.cellForItem(at: indexPath);
    }
}
