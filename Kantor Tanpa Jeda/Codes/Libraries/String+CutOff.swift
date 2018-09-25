//
//  String+CutOff.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 1/22/18.
//  Copyright © 2018 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func cutOff (max: Int, hardCut: Bool = false) -> String {
        if self.count < max { return self; }
        var pos = -1;
        var ellipsis = "";
        for (idx, c) in self.enumerated() {
            if String(c) == " " { pos = idx; }
            if idx > max { ellipsis = "..."; break; }
        }
        if pos == -1 { pos = max; }
        if hardCut { pos = min (max, self.count); }
        
        return String(self.prefix(pos)) + ellipsis;
    }
    
}
