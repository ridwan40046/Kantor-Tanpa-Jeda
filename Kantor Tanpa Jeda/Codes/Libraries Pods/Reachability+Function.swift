//
//  Reachability+Function.swift
//  Family Tree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import Reachability

let reachability = Reachability()!;

func networkIsReachable() -> Bool {
    let result = reachability.connection == .wifi || reachability.connection == .cellular;
    if result == false {
        whistleError("Cannot connect to the internet");
    }
    return result;
}

