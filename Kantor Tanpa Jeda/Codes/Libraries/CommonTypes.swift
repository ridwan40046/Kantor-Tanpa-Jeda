//
//  CommonTypes.swift
//  FamilyTree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation

typealias Dict = [String: Any];
typealias DictOpt = [String: Any?];
typealias DictObj = [String: AnyObject];
typealias Arr = [Dict];
typealias DictString = [String: String];
typealias DictStringOpt = [String: String?];
typealias ArrString = Array<String>
typealias ArrInt = Array<Int>
typealias ArrBool = Array<Bool>
typealias ModelReturn = ((FireObject?)->Void)
typealias Return<T> = ((T)->Void)
typealias Change<T> = ((T)->T)
typealias Callback = (()->Void);
typealias Rereturn<T> = ((T)->((T)->Void)?)

