//
//  Primitive+Typecasting.swift
//  Family Tree
//
//  Created by Martin Tjandra on 2/12/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    var string: String { return String(self); }
    func string(leadingZeroToLength: Int) -> String {
        var result = self.string;
        while result.count < leadingZeroToLength { result = "0" + result; }
        return result;
    }
    var date: Date { return Date.init(timeIntervalSince1970: TimeInterval(self)); }
    var bool: Bool { return self != 0; }
    var double: Double { return Double(self); }
    var cgFloat: CGFloat { return CGFloat(self); }
    var float: Float { return Float(self); }
}

extension String {
    var int: Int? { return Int(self); }
    func date(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format;
        return formatter.date(from: self);
    }
    var bool: Bool? {
        let text = self.uppercased().trim();
        if text == "TRUE" || text == "YES" { return true; }
        else if text == "FALSE" || text == "NO" { return false; }
        else { return nil; }
    }
    var double: Double? { return Double.init(self); }
    var cgFloat: CGFloat? {
        if let d = NumberFormatter().number(from: self) { return CGFloat(truncating: d); } else { return nil; }
    }
    var float: Float? { return Float.init(self); }
}

extension Date {
    var int: Int { return self.timeIntervalSince1970.int; }
}

extension TimeInterval {
    var date: Date { return Date.init(timeIntervalSince1970: correctTimeInterval); }
    var correctTimeInterval : TimeInterval { return self > 100000000000 ? self / 1000 : self; }
    var localDate: Date {
        let data : TimeInterval = self.correctTimeInterval + TimeInterval(TimeZone.current.secondsFromGMT());
        return Date.init(timeIntervalSince1970: data);
    }
}

extension Double {
    var int: Int { return Int(floor(self)); }
    mutating func rounding() -> Int { return Int(Darwin.round(self)); }
    var whole: Double { return floor(self); }
    var remainder: Double { return self - floor(self); }
    var string: String { return String(self); }
}

extension CGFloat {
    var int: Int { return Int(floor(self)); }
    mutating func rounding() -> Int { return Int(Darwin.round(self)); }
    var whole: CGFloat { return floor(self); }
    var remainder: CGFloat { return self - floor(self); }
    var string: String { return "\(self)"; }
}

extension Bool {
    
    var int: Int { return (self ? 1 : 0); }
    var string: String { return self ? "true" : "false"; }
}


