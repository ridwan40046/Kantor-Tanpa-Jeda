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

typealias dictStringOpt = Dictionary<String, String?>
typealias dictTypeOpt = Dictionary<String, AnyObject?>
typealias dictString = Dictionary<String, String>
typealias dictType = Dictionary<String, AnyObject>
typealias arrType = Array<dictType>
typealias arrString = Array<String>
typealias JSONreturn = ((RequestStatusType, AnyObject?)->Void)
typealias ModelReturn = ((JsonObject?)->Void)
typealias Return<T> = ((T)->Void)

enum RequestStatusType {
    case timeout
    case invalidAccessToken
    case serverError
    case generalError
    case customError
    case noResponseError
    case success
    case invalidUrl
    case notFound
}
