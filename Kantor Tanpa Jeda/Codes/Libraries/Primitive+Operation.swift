//
//  Primitive+Operation.swift
//  Queue Manager
//
//  Created by Martin Tjandra on 03/05/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    typealias CurrentType = Double;
    
    func add (_ n: Int?)     -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Float?)   -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Double?)  -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    
    func sub (_ n: Int?)     -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Float?)   -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Double?)  -> CurrentType { return n == nil ? self : self - CurrentType(n!); }

    func mul (_ n: Int?)     -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Float?)   -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Double?)  -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    
    func div (_ n: Int?)     -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Float?)   -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Double?)  -> CurrentType { return n == nil ? self : self / CurrentType(n!); }

    func mod (_ n: Int?)     -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: Float?)   -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: Double?)  -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }

    var ceiled : CurrentType { return ceil(self); }
    var floored : CurrentType { return floor(self); }
    var decimals : CurrentType { return self-self.ceiled; }
    
}

extension CGFloat {
    
    typealias CurrentType = CGFloat;
    
    func add (_ n: Int?)     -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Float?)   -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Double?)  -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    
    func sub (_ n: Int?)     -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Float?)   -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Double?)  -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    
    func mul (_ n: Int?)     -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Float?)   -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Double?)  -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    
    func div (_ n: Int?)     -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Float?)   -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Double?)  -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    
    func mod (_ n: Int?)     -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: Float?)   -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: Double?)  -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    
    var ceiled : CurrentType { return CurrentType(ceil(Double(self))); }
    var floored : CurrentType { return CurrentType(floor(Double(self))); }
    var decimals : CurrentType { return self-self.floored; }
    
}

extension Int {
    
    typealias CurrentType = Int;
    
    func add (_ n: Int?)     -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Float?)   -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Double?)  -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    
    func sub (_ n: Int?)     -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Float?)   -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Double?)  -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    
    func mul (_ n: Int?)     -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Float?)   -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Double?)  -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    
    func div (_ n: Int?)     -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Float?)   -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Double?)  -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    
    func mod (_ n: Int?)     -> CurrentType { return n == nil ? self : self % CurrentType(n!); }
    func mod (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self % CurrentType(n!); }
    func mod (_ n: Float?)   -> CurrentType { return n == nil ? self : self % CurrentType(n!); }
    func mod (_ n: Double?)  -> CurrentType { return n == nil ? self : self % CurrentType(n!); }
    
    func forEach (callback: ((Int)->Void)) { for i in 0..<self { callback(i); } }
    func forEach (callback: (()->Void)) { for _ in 0..<self { callback(); } }
    func `repeat` (string: String)->String { var v = ""; self.forEach { v += string; }; return v; }
    
}

extension Float {
    
    typealias CurrentType = Float;
    
    func add (_ n: Int?)     -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Float?)   -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    func add (_ n: Double?)  -> CurrentType { return n == nil ? self : self + CurrentType(n!); }
    
    func sub (_ n: Int?)     -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Float?)   -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    func sub (_ n: Double?)  -> CurrentType { return n == nil ? self : self - CurrentType(n!); }
    
    func mul (_ n: Int?)     -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Float?)   -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    func mul (_ n: Double?)  -> CurrentType { return n == nil ? self : self * CurrentType(n!); }
    
    func div (_ n: Int?)     -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Float?)   -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    func div (_ n: Double?)  -> CurrentType { return n == nil ? self : self / CurrentType(n!); }
    
    func mod (_ n: Int?)     -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: CGFloat?) -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: Float?)   -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    func mod (_ n: Double?)  -> CurrentType { return n == nil ? self : self.truncatingRemainder(dividingBy: CurrentType(n!)); }
    
    var ceiled : CurrentType { return CurrentType(ceil(Double(self))); }
    var floored : CurrentType { return CurrentType(floor(Double(self))); }
    var decimals : CurrentType { return self-self.ceiled; }
    
}

extension Bool {
    
    var flip : Bool { return !self; }
    
}
