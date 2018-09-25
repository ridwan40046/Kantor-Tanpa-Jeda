//
//  UIView+ParentSearch.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 7/24/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var parentTableViewCell : UITableViewCell? {
        var cur : UIView? = self;
        while cur != nil {
            if let result = cur as? UITableViewCell { return result; }
            else { cur = cur?.superview; }
        }
        return nil;
    }
    
    var parentTableView : UITableView? {
        var cur : UIView? = self;
        while cur != nil {
            if let result = cur as? UITableView { return result; }
            else { cur = cur?.superview; }
        }
        return nil;
    }
    
    var parentCollectionViewCell : UICollectionViewCell? {
        var cur : UIView? = self;
        while cur != nil {
            if let result = cur as? UICollectionViewCell { return result; }
            else { cur = cur?.superview; }
        }
        return nil;
    }
    
    var parentCollectionView : UICollectionView? {
        var cur : UIView? = self;
        while cur != nil {
            if let result = cur as? UICollectionView { return result; }
            else { cur = cur?.superview; }
        }
        return nil;
    }
    
    var indexPath : IndexPath? {
        var cur : UIView? = self;
        var foundTableView : UITableView?;
        var foundCollectionView : UICollectionView?;
        while cur != nil {
            if let result = cur as? UICollectionView { foundCollectionView = result; break;}
            if let result = cur as? UITableView { foundTableView = result; break;}
            else { cur = cur?.superview; }
        }
        if let parent = foundTableView { return parent.indexPath(for: self); }
        else if let parent = foundCollectionView { return parent.indexPath(for: self); }
        return nil;
    }
    
    var sectionNumber : Int? {
        var cur : UIView? = self;
        var foundTableView : UITableView?;
        var foundCollectionView : UICollectionView?;
        while cur != nil {
            if let result = cur as? UICollectionView { foundCollectionView = result; break;}
            if let result = cur as? UITableView { foundTableView = result; break;}
            else { cur = cur?.superview; }
        }
        if let parent = foundTableView { return parent.sectionNumber(for: self); }
        else if let parent = foundCollectionView { return parent.sectionNumber(for: self); }
        return nil;
    }
}
