//
//  UITableView+ReloadDataOffset.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 06/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func reloadDataOffset() {
        let curOffset = self.contentOffset;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedRowHeight = 0;
        self.reloadData();
        self.contentOffset = curOffset;
    }
    
}
