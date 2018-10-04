//
//  JsonObject.swift
//  Kantor Tanpa Jeda
//
//  Created by Asad Ardiansyah on 02/10/18.
//  Copyright © 2018 Ridwan Surya Putra. All rights reserved.
//

import Foundation
import Alamofire

class JsonObject : CustomStringConvertible, CustomDebugStringConvertible {
    
    var oriData : AnyObject?;
    var rawData : AnyObject?;
    var error : Error?;
    var errorHttp : Error?;
    var errorInfo : String?;
    var response : HTTPURLResponse?;
    var responseStatus : ResponseStatus?;
    var parent : BaseModel?;
    
    init?(json: AnyObject?, response: HTTPURLResponse? = nil, errorInfo: String? = nil, parent: BaseModel? = nil) {
        if json == nil && response == nil && errorInfo == nil { return nil; }
        
        if let data = json as? dictType { rawData = data as AnyObject; }
        else if let data = json as? arrType { rawData = data as AnyObject; }
        else if let sjson = json as? String {
            if let data = sjson.jsonToDict { rawData = data as AnyObject; }
            else if let data = sjson.jsonToArr { rawData = data as AnyObject; }
        }
        
        self.response = response;
        self.errorInfo = errorInfo;
        self.parent = parent;
    }
    
    init?(obj: JsonObject?, parent: BaseModel? = nil) {
        guard let obj = obj else { return nil; }
        self.rawData = obj.rawData;
        self.response = obj.response;
        self.errorInfo = obj.errorInfo;
        self.error = obj.error;
        self.responseStatus = obj.responseStatus;
        self.parent = parent ?? obj.parent;
    }
    
    init?(_ any: AnyObject??, response: HTTPURLResponse? = nil, errorInfo: String? = nil, parent: BaseModel? = nil) {
        if let obj = any as? JsonObject {
            self.oriData = obj.oriData;
            self.rawData = obj.rawData;
            self.response = obj.response;
            self.errorInfo = obj.errorInfo;
            self.errorHttp = obj.errorHttp;
            self.responseStatus = obj.responseStatus;
            self.parent = parent ?? obj.parent;
        }
        else {
            let json = any;
            if json == nil && response == nil && errorInfo == nil { return nil; }
            
            if let data = json as? dictType { rawData = data as AnyObject; }
            else if let data = json as? arrType { rawData = data as AnyObject; }
            else if let data = json as? arrString { rawData = data as AnyObject; }
            else if let sjson = json as? String {
                if let data = sjson.jsonToDict { rawData = data as AnyObject; }
                else if let data = sjson.jsonToArr { rawData = data as AnyObject; }
            }
            
            self.response = response;
            self.errorInfo = errorInfo;
            self.parent = parent;
        }
    }
    
    init (data: Data?, response: URLResponse?, error: Error?, param: dictString? = nil) {
        
        self.error = error as NSError?;
        self.errorInfo = self.error?.localizedDescription;
        guard let res = response as? HTTPURLResponse else { responseStatus = .noContent; return; }
        self.response = res;
        if data == nil { return; }
        
        do {
            if res.statusCode == 404 {
                responseStatus = ResponseStatus.notFound404;
                errorInfo = "Error 404 Not Found: The resources this app trying to access at \(res.url!) cannot be found.";
                rawData = nil;
                return;
            }
            
            var dict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? Dictionary<String, AnyObject>;
            //if (dict != nil) { print (dict!); }
            
            if (res.statusCode == 400 || res.statusCode == 401 || res.statusCode == 403) {
                responseStatus = ResponseStatus.unauthorized401;
                errorInfo = "Token Error: Error occured while trying to authenticated with the server.";
            }
            else if (error != nil) {
                responseStatus = ResponseStatus.other;
                errorInfo = "Error \(res.statusCode) in \(error!._domain): \(error?.localizedDescription ?? "nil")";
            }
            else if (dict != nil && dict!["error"] != nil){
                responseStatus = ResponseStatus.custom;
                errorInfo = "Error: \(dict!["error"] as! String)";
                //                print (errorInfo!)
            }
            else if (res.statusCode >= 200 && res.statusCode < 300) {
                responseStatus = ResponseStatus.success200;
                errorInfo = nil;
                rawData = dict as AnyObject;
            }
            else {
                responseStatus = ResponseStatus.other;
                errorInfo = "Unknown Error";
            }
        } catch _ as NSError {
            if (res.statusCode == 405) {
                responseStatus = ResponseStatus.methodNotAllowed405;
                errorInfo = "Error 405 Method Not Allowed: The method the app want to use to access resource \(res.url!) is invalid.";
            }
            else {
                responseStatus = ResponseStatus.cannotParseJSON;
                errorInfo = "The app has problem when communicating with server. Please contact administrator.";
                print ("Cannot parse JSON, response = \(res)")
            }
        }
    }
    
    init (alamofireResponse response: Alamofire.DataResponse<Any>?) {
        
        if let json = response?.result.value {
            let dataArr = json as? arrType;
            let dataDict = json as? dictType;
            if dataArr != nil || dataDict != nil { rawData = json as AnyObject; }
        }
        self.response = response?.response;
        self.error = response?.error;
        
    }
    
    func copy (obj: JsonObject?, parent: BaseModel? = nil) {
        guard let obj = obj else { return; }
        self.rawData = obj.rawData;
        self.response = obj.response;
        self.errorInfo = obj.errorInfo;
        self.error = obj.error;
        self.responseStatus = obj.responseStatus;
        self.parent = parent ?? obj.parent;
    }
    
    func copyStatus (obj: JsonObject?) {
        guard let obj = obj else { return; }
        self.response = obj.response;
        self.errorInfo = obj.errorInfo;
        self.error = obj.error;
        self.responseStatus = obj.responseStatus;
    }
    
    func copyResult (obj: JsonObject?) {
        guard let obj = obj else { return; }
        copyStatus(obj: obj);
        self.rawData = obj.rawData;
    }
    
    var dict : dictType? {
        get { if let dict = rawData as? dictType {
            if let dictData = dict["data"] as? dictType { return dictData; } else { return dict; } }
        else { return nil; }
        }
        set { rawData = newValue as AnyObject?; }
    }
    
    var dictStr : dictString? {
        get { if let dict = rawData as? dictType {
            if let dictData = dict["data"] as? dictString { return dictData; } else { return dict as? dictString; } }
        else { return nil; }
        }
        set { rawData = newValue as AnyObject?; }
    }
    
    var arr : arrType? {
        get { if let arr = rawData as? arrType { return arr; } else {
            if let dict = rawData as? dictType {
                if let arr = dict["data"] as? arrType { return arr; } else { return [dict]; } }
            }
            return nil;
        }
        set { rawData = newValue as AnyObject?; }
    }
    
    var errorMessage : String? {
        if let error = ErrorObj(obj: self)?.details { return error; }
        var result : String = "";
        if let dictForm = rawData as? dictType { result = (dictForm["error"] as? String) ?? ""; }
        if result != "" { result += "\n"; }
        result += errorInfo ?? "";
        if result == "" { return nil; }
        return result;
    }
    
    func clear () { rawData = nil; }
    
    func isSuccess() -> Bool {
        if ErrorObj(obj: self)?.details != nil { return false; }
        if errorMessage != nil { return false; }
        if let statusCode = response?.statusCode, !(200...299 ~= statusCode) { return false; }
        return true;
        
        //        if let _ = rawData as? arrType { return true; }
        //        if let dictForm = rawData as? dictType {
        //            if dictForm["data"] != nil { return true; }
        //            else if dictForm["error"] != nil { return false; }
        //            return true; // this is not a top level dictionary, but valid
        //        }
        //        return false; // not an array or dictionary
    }
    
    func isAccessTokenExpired() -> Bool {
        if let res = response { return res.statusCode == 400 || res.statusCode == 401 || res.statusCode == 403; } else { return false; }
    }
    
    func hasData() -> Bool {
        if (rawData as? dictType) != nil || (rawData as? arrType) != nil { return true; } else { return false; }
    }
    
    var className: String { return NSStringFromClass(type(of: self)) }
    
    var debugDescription: String {
        if let dict = dict { return ("Content of \(self.className): Dictionary \n\(dict)") }
        else if let arr = arr { return ("Content of \(self.className): Array \n\(arr)") }
        else if let rawData = rawData { return ("Content of \(self.className): AnyObject \n\(rawData)") }
        else { return ("Content of \(self.className): nil") }
    }
    
    var description: String { return debugDescription; }
    
    func printClassName () { print (String(describing: self)); }
    
}
