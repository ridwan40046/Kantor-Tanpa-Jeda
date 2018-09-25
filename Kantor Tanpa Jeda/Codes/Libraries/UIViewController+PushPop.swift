//
//  UIViewController+Push.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/27/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func push (vcNamed: String?, callback: ((UIViewController?)->Void)? = nil) {
        guard let vcNamed = vcNamed else { callback?(nil); return; }
        let vc = UIViewController.instantiate(named: vcNamed)
        self.view.endEditing(true);
        self.view.window?.endEditing(true);
        self.navigationController?.pushViewController(vc!, animated: true)
        callback?(vc);
    }
    
    func push (vc: UIViewController?, callback: ((UIViewController?)->Void)? = nil) {
        guard let vc = vc else { toast ("Vc to be pushed is nil."); return; }
        guard let navcon = self.navigationController else { toast ("Can't get navcon. Missing container?"); return; }
        self.view.endEditing(true);
        self.view.window?.endEditing(true);
        navcon.pushViewController(vc, animated: true);
        callback? (vc);
    }
    
    func pop (animated: Bool = true) {
        self.view.endEditing(true);
        self.navigationController?.popViewController(animated: animated);
    }

    func popToRoot (animated: Bool = true) {
        self.view.endEditing(true);
        self.navigationController?.popToRootViewController(animated: animated);
    }

    @discardableResult
    func show (from vc: UIViewController?) -> UIViewController? {
        guard let navcon = vc?.navigationController else { toast ("Can't get navcon. Missing container?"); return self; }
//        self.view.endEditing(true);
        navcon.pushViewController(self, animated: true);
        return self;
    }
}
