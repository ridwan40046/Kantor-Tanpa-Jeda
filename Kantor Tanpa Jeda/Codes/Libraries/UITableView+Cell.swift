//
//  UITableView+Cell.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 9/20/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func cell (_ name: String? = "cell") -> UITableViewCell? {
        guard let name = name else { return nil; }
        return dequeueReusableCell(withIdentifier: name);
    }
    
    func cell (section: Int?, row: Int?) -> UITableViewCell? {
        guard let section = section, let row = row else { return nil; }
        return self.cellForRow(at: IndexPath(row: row, section: section));
    }
    
    func cell (indexPath: IndexPath?) -> UITableViewCell? {
        guard let indexPath = indexPath else { return nil; }
        return self.cellForRow(at: indexPath);
    }
    
    func cellWithTap (_ name: String? = "cell") -> UITableViewCell? {
        guard let name = name else { return nil; }
        let cell = dequeueReusableCell(withIdentifier: name);
        cell?.contentView.addTapGestureRecognizer(self, action: #selector(cellTapped(_:)));
        return cell;
    }
    
    @objc func cellTapped (_ sender: UITapGestureRecognizer) {
        guard let indexPath = sender.view?.indexPath else { return; }
        delegate?.tableView?(self, didSelectRowAt: indexPath);
    }
}
