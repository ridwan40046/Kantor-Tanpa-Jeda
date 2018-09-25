//
//  ObjectAssociation.swift
//  Family Tree
//
//  Created by Martin Tjandra on 3/6/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit

public final class ObjectAssociation<T: AnyObject> {
    
    private let policy: objc_AssociationPolicy
    
    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        
        self.policy = policy
    }
    
    /// Accesses associated object.
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: AnyObject) -> T? {
        
        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as! T? }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}


//How to use:
//
//extension SomeType {
//
//    private static let association = ObjectAssociation<NSObject>()
//
//    var simulatedProperty: NSObject? {
//
//        get { return SomeType.association[self] }
//        set { SomeType.association[self] = newValue }
//    }
//
//    var email: String? {
//
//        get { return SomeType.association[self] as? String }
//        set { SomeType.association[self] = NSObject(newValue) }
//    }
//}
