//
//  UITableView+BackgroundMessage.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 07/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func backgroundMessage (text: String?) {
//        let view = UIView.init(frame: self.bounds);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight];
//        view.backgroundColor = UIColor.clear;
        let label = UILabel.init(frame: self.bounds);
        label.font = UIFont.systemFont(ofSize: 14);
        label.textColor = UIColor.lightGray;
        label.textAlignment = .center;
        label.text = text;
        label.numberOfLines = 0;
//        label.sizeToFit();
//        label.center = view.center;
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight];
//        view.addSubview(label);
        self.backgroundView = label;
    }
    
    func backgroundMessageNoData() {
        backgroundMessage(text: "No data to display. Pull down to refresh.");
    }
    
    func backgroundMessageFailed() {
        backgroundMessage(text: "Failed to load. Pull down to refresh.");
    }
    
    
}
