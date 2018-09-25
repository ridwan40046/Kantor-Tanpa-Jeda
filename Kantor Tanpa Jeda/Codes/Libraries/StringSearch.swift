//
//  StringSearch.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/14/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

//class StringSearch {
//
//    var string: String!;
//    var pos: String.Index!;
//
//    init?(_ string: String?) {
//        guard let string = string else { return nil; }
//        self.string = string;
//        pos = self.string.startIndex;
//    }
//
//    func find(_ string: String?) -> StringSearch {
//        guard let string = string else { return self; }
//        let result = StringSearch(string)!;
//        result.pos = self.string?.range(of: string)?.lowerBound;
//        return result;
//    }
//
//    func findNext(_ string: String?, count: Int = 1) -> StringSearch {
//        if count <= 0 { return self; }
//        let result = StringSearch(string)!;
//        if pos == nil { return find(string); }
//        let newStr = self.string?[pos...];
//        result.pos = newStr?.range(of: string)?.lowerBound;
//        return result;
//    }
//
//    func getNext (_ ncharacter: Int) -> String {
//
//        return string[pos..<pos.index]
//    }
//
//}

