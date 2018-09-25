//
//  UIDropDownList.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/13/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

class UIDropDownList : UITableView {
    
    var data: [String]?;
    var cellHeight: CGFloat = 44;
    var fontSize: CGFloat = 14;
    var callback: ((Int)->Bool)?;
    var selected: String?;

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style);
        self.autoresizingMask = [.flexibleBottomMargin, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleWidth];
        self.delegate = self;
        self.dataSource = self;
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.autoresizingMask = [.flexibleBottomMargin, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleWidth];
        self.delegate = self;
        self.dataSource = self;
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
    }
    
    
    func initData(_ data : [String]?, cellHeight : CGFloat? = nil, fontSize: CGFloat? = nil) {
        self.data = data;
        self.cellHeight = cellHeight ?? self.cellHeight;
        self.fontSize = fontSize ?? self.fontSize;
    }
    
    func unfold(inside: UIView?, frame: CGRect?, selected: String? = nil, callback: ((Int)->Bool)?) {
        if isUnfolded { rollUp(); return; }
        guard let inside = inside, let frame = frame else
            { print ("UIDropDownList can't unfold: insufficient data"); return; }
        inside.addSubview(self);
        self.frame = frame;
        self.callback = callback;
        self.height = 0;
        self.selected = selected;
        UIView.animate(withDuration: 0.3) { self.frame = frame; }
        
        
        for i in 0..<(data?.count ?? 0) {
            if let d = data?[i], let s = selected, d == s { self.scrollToRow(at: IndexPath.init(row: i, section: 0), at: .middle, animated: true); }
        }
        

    }
    
//    static func unfold(dataSource: [String]?, inside: UIView?, frame: CGRect?, delegateSe: UIDropDownListDelegate?, cellHeight: CGFloat? = nil, fontSize: CGFloat? = nil) {
//        let me = UIDropDownList();
//        me.initData(dataSource, cellHeight: cellHeight, fontSize: fontSize);
//        me.unfold(inside: inside, frame: frame, delegateSelect: delegate);
//    }
    
    func rollUp() {
        UIView.animate(withDuration: 0.3, animations: { self.height = 0; }) { done in self.removeFromSuperview();
        }
    }
    
    var isUnfolded: Bool { return self.superview != nil; }
    
}

extension UIDropDownList: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1; }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        { return data?.count ?? 0; }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        { return cellHeight; }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!;
        cell.height = cellHeight;
        if cell.label(1) == nil {
            let lbl = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: cell.width - 20 * 2, height: cellHeight));
            lbl.tag = 1;
            lbl.autoresizingMask = [.flexibleBottomMargin, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleWidth];
            cell.addSubview(lbl);
        }
        cell.label(1)?.font = UIFont.systemFont(ofSize: 14);
        cell.label(1)?.textColor = UIColor.black;
//        cell.label(1)?.backgroundColor = UIColor.yellow;
        cell.label(1)?.text = data?[indexPath.row];
        if let s1 = cell.label(1)?.text, let s2 = selected, s1 == s2
        { cell.accessoryType = .checkmark; } else { cell.accessoryType = .none; }
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = data?[indexPath.row];
        tableView.reloadData();
        if let evaluate = callback?(indexPath.row), evaluate == true { rollUp(); }
    }
    
}
