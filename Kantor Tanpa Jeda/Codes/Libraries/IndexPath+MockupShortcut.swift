//
//  IndexPath+MockupShortcut.swift
//  LearnFlux
//
//  Created by ISA on 5/8/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension IndexPath {
    
    var code : String { return "\(self.section)-\(self.row)"; }
    func isEqual (codeCompare: String)->Bool { return self.code == codeCompare; }
    
}
