//
//  String+PrefixPostfix.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 10/24/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func prefixed (by: String?) -> String {
        return (by ?? "") + self;
    }

    func postfixed (by: String?) -> String {
        return self + (by ?? "");
    }

}
