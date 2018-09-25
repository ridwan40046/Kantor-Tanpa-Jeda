//
//  PersistentDictionary.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 7/27/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

class PersistentDictionary <T> {
    
    var dict : Dictionary <String, T> = [:];
    
    init? (key: String?) {
        guard let key = key else { return nil; }
        let dict = UserDefaults.standard.object(forKey: key);
        self.dict = (dict as? Dictionary <String, T>) ?? [:];
    }
    
    subscript (key: String)->T? {
        get { return dict[key]; }
        set { dict[key] = newValue;
            UserDefaults.standard.setValue(dict as AnyObject, forKey: key);
            UserDefaults.standard.synchronize();
        }
    }

    
}
