//
//  CommonUtilitySwift.swift
//  LearnFlux
//
//  Created by Martin Darma Kusuma Tjandra on 5/3/16.
//  Copyright © 2016 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import Toaster

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

infix operator ^ : MultiplicationPrecedence
func ^ (left: Bool, right: Bool) -> Bool { return !(left == right) }

class Util : NSObject {
    
    static func getSmallStringMonth(_ int: Int?)->String? {
        guard let int = int else { return nil; }
        switch int {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sep"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Des"
        default:
            return ""
        }
    }
    
    static func randomizePastelColor () -> UIColor {
        let r = (CGFloat(arc4random_uniform(128)) + 128.0) / 255.0;
        let g = (CGFloat(arc4random_uniform(128)) + 128.0) / 255.0;
        let b = (CGFloat(arc4random_uniform(128)) + 128.0) / 255.0;
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    static func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    static func datetime(timestamp: Double?) -> (date: String, time: String)?{
        guard let timestamp = timestamp else { return nil; }
        let date = Date(timeIntervalSince1970 : (timestamp))
        let dateFormatter : DateFormatter = {
            let tmpFormatter = DateFormatter()
            tmpFormatter.dateStyle = .long
            return tmpFormatter
        }()
        let timeFormatter : DateFormatter = {
            let tmpFormatter = DateFormatter()
            tmpFormatter.timeStyle = .short
            return tmpFormatter
        }()
        return (date: dateFormatter.string(from: date), time: timeFormatter.string(from: date))
    }
    
    static func datetime(string: String?) -> (date: String, time: String)? {
        guard let _string = string, let double = Double(_string) else { return nil; }
        return datetime(timestamp: double);
    }
    
    static func date(timestamp: Double?)->Date? {
        guard var timestamp = timestamp else { return nil; }
        if timestamp > 100000000000 { timestamp = timestamp / 1000; }
        return Date(timeIntervalSince1970: timestamp);
    }

    static func date(timestamp: String?)->Date? {
        guard let timestamp = timestamp else { return nil; }
        return date(timestamp: Double(timestamp));
    }

    
    static func changeModelTime(_ timestamp: Double) -> (String){
        let dateFormatter: DateFormatter = {
            let tmpFormattter = DateFormatter()
            tmpFormattter.dateFormat = "H:m"
            return tmpFormattter
        }()
        return dateFormatter.string(from: Date(timeIntervalSince1970: timestamp ))
    }
    
    static func dateFromString(_ string: String, format: String? = nil)->Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = format ?? "yy-MM-dd HH:mm:ss +0000";
        formatter.locale = NSLocale.current
        formatter.timeZone = TimeZone.current
    
        return formatter.date(from: string)
    
    }
    enum DateStringType { case date, time, datetime, datetimezone; };
    static func stringFromTimestamp(_ timestamp: Double?, type : DateStringType = .date)->(String){
        guard let timestamp = timestamp else { return ""; }
        let timestampDbl = Double(timestamp) / 1000.0;
        let formatter: DateFormatter = {
            let tmpFormatter = DateFormatter()
            
            tmpFormatter.locale = NSLocale.current
            switch (type) {
         //   case .date: tmpFormatter.dateFormat = "yy-MM-dd"; break;
            case .date: tmpFormatter.dateFormat = "MMM dd, yyyy "
            case .time: tmpFormatter.dateFormat = "HH:mm:ss"; break;
            case .datetime: tmpFormatter.dateFormat = "yy-MM-dd HH:mm:ss"; break;
            case .datetimezone: tmpFormatter.dateFormat = "yy-MM-dd HH:mm:ss +0000"; break;
            }
      
            return tmpFormatter
        }()
        return formatter.string(from: Date(timeIntervalSince1970: timestampDbl))
    }
    
    static func stringYearFromTimestamp(_ timestamp: Double?, type : DateStringType = .date)->(String){
        guard let timestamp = timestamp else { return ""; }
        let timestampDbl = Double(timestamp) / 1000.0;
        let formatter: DateFormatter = {
            let tmpFormatter = DateFormatter()
            
            tmpFormatter.locale = NSLocale.current
            switch (type) {
            //   case .date: tmpFormatter.dateFormat = "yy-MM-dd"; break;
            case .date: tmpFormatter.dateFormat = "dd MMM yyyy "
            case .time: tmpFormatter.dateFormat = "HH:mm:ss"; break;
            case .datetime: tmpFormatter.dateFormat = "yy-MM-dd HH:mm:ss"; break;
            case .datetimezone: tmpFormatter.dateFormat = "yy-MM-dd HH:mm:ss +0000"; break;
            }
            
            return tmpFormatter
        }()
        return formatter.string(from: Date(timeIntervalSince1970: timestampDbl))
    }
    
    static func stringMonthFromTimestamp(_ timestamp: Double?, type : DateStringType = .date)->(String){
        guard let timestamp = timestamp else { return ""; }
        let timestampDbl = Double(timestamp) / 1000.0;
        let formatter: DateFormatter = {
            let tmpFormatter = DateFormatter()
            
            tmpFormatter.locale = NSLocale.current
            switch (type) {
            //   case .date: tmpFormatter.dateFormat = "yy-MM-dd"; break;
            case .date: tmpFormatter.dateFormat = "dd MMM "
            case .time: tmpFormatter.dateFormat = "HH:mm:ss"; break;
            case .datetime: tmpFormatter.dateFormat = "yy-MM-dd HH:mm:ss"; break;
            case .datetimezone: tmpFormatter.dateFormat = "yy-MM-dd HH:mm:ss +0000"; break;
            }
            
            return tmpFormatter
        }()
        return formatter.string(from: Date(timeIntervalSince1970: timestampDbl))
    }

    
    static func getElementDate(_ element: NSCalendar.Unit, stringDate: String?)->Int?{
        guard let stringDate = stringDate else { return nil; }
        let date = dateFromString(stringDate)
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        if let inDate = date{
            return (calendar as NSCalendar).component(element, from: inDate)
        }
        return nil
    }
    
    static func showMessageInViewController(_ viewController: UIViewController?, title: String, message: String, buttonOKTitle: String = "Ok", allowInProduction: Bool = true, callback: (()->Void)? = nil) -> () {
        // convenience to silence all show message that was meant for error logging debugging
//        if locker.deploymentMode == DeploymentMode.production && allowInProduction == false {
//            print ("\n\(title): \(message)\n");
//            callback?();
//            return;
//        }
        if (viewController == nil) { return; }
        let alertController: UIAlertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let actionOk: UIAlertAction = UIAlertAction(title:buttonOKTitle, style: .default) { (nil)->() in
            if (callback != nil) { callback!(); }
        }
        alertController.addAction(actionOk)
        DispatchQueue.main.async {
            viewController!.present(alertController, animated: true, completion: nil)
        }
    }
    
    /** Swift 3 style for show message func */
    static func showMessage(viewController: UIViewController?, title: String, message: String, buttonOKTitle: String = "Ok", allowInProduction: Bool = true, callback: (()->Void)? = nil) -> () {
        self.showMessageInViewController(viewController, title: title, message: message, buttonOKTitle: buttonOKTitle, allowInProduction: allowInProduction, callback: callback);
    }
    
    /** For logging convenience of show message */
    static func log (viewController: UIViewController?, title: String, message: String, buttonOKTitle: String = "Ok", callback: (()->Void)? = nil) -> () {
        self.showMessageInViewController(viewController, title: title, message: message, buttonOKTitle: buttonOKTitle, allowInProduction: false, callback: callback);
    }

    
    static func showChoiceInViewController(_ viewController: UIViewController?, title: String, message: String, buttonTitle: [String], buttonStyle: [UIAlertActionStyle?]?,callback: ((Int)->Void)?) -> () {
        if (viewController == nil) { return; }
        let alertController: UIAlertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        
        for i in 0..<buttonTitle.count {
            let btn = buttonTitle[i];
            var style : UIAlertActionStyle = UIAlertActionStyle.default;
            if (buttonStyle != nil) {
                if (buttonStyle![i] != nil) {
                    style = buttonStyle![i]!;
                }
            }
            let action: UIAlertAction = UIAlertAction(title:btn, style: style) { (nil)->Void in
                if (callback != nil) { callback!(i); }
            }
            alertController.addAction(action)
        }
        
        DispatchQueue.main.async {
            viewController!.present(alertController, animated: true, completion: nil)
        }
    }
  
    static func showChoiceInViewController(_ viewController: UIViewController?, title: String, message: String, buttonOKTitle: String = "Ok", buttonCancelTitle: String = "Cancel", callback: ((Int)->Void)? = nil) -> () {
        if (viewController == nil) { return; }
        let alertController: UIAlertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        
        let actionOk: UIAlertAction = UIAlertAction(title:buttonOKTitle, style: .default) { (nil)->() in
            if (callback != nil) {
                callback!(0)
            }
        }
        alertController.addAction(actionOk)
        
        let actionCancel: UIAlertAction = UIAlertAction(title:buttonCancelTitle, style: .cancel) { (nil)->() in
            if (callback != nil) {
                callback!(1)
            }
        }
        alertController.addAction(actionCancel)

        DispatchQueue.main.async {
            viewController!.present(alertController, animated: true, completion: nil)
        }
    }
    
    static var networkIndicatorCtr = 0;
    static func showNetworkIndicator() {
        networkIndicatorCtr += 1;
        UIApplication.shared.isNetworkActivityIndicatorVisible = true;
    }
    static func hideNetworkIndicator() {
        networkIndicatorCtr -= 1;
        if networkIndicatorCtr == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false;
        }
    }
    
    static func showIndicatorDarkOverlay (_ view: UIView, message: String = "") {
        if (view.viewWithTag(12937) != nil) {
            stopIndicator(view);
        }
        
        let overlay = UIView(frame: view.bounds);
        overlay.autoresizingMask = [];
        overlay.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3);
        overlay.tag = 12937;
        view.addSubview(overlay);
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        indicator.center = overlay.center
        indicator.autoresizingMask = [.flexibleBottomMargin, .flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin];
        overlay.addSubview(indicator)
        overlay.bringSubview(toFront: indicator);
        view.bringSubview(toFront: overlay);
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        indicator.startAnimating();
        
        let label = UILabel();
        label.text = message;
        label.font = label.font.withSize(15);
        label.textColor = UIColor.white;
        label.center = overlay.center;
        
        if (message != "") {
            indicator.y -= 20;
            label.y += 20;
        }
        
    }
    
    static func stopIndicator (_ view: UIView) {
        let vcs = view.viewWithTag(12937);
        var vc : UIView!;
        if (vcs != nil) {
            vc = vcs
            vc.removeFromSuperview();
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

    static func getViewControllerID(_ vcname: String, fromStoryboard storyboardName: String? = nil) -> UIViewController {
        return UIViewController.instantiate(named: vcname, fromStoryboard: storyboardName)!
    }
    
    static let keyboardAnimationDuration : CGFloat = 0.25
    
    static var fixPortraitKeyboardHeight: CGFloat = 216;
    static var fixLandscapeKeyboardHeight: CGFloat = 162;
    
    static func animateSetFocus(_ controller: UIViewController, toView: UIView, distance: inout Double, duration: CGFloat = keyboardAnimationDuration, keyboardHeight : CGFloat? = nil){
        let minimumScrollFraction : CGFloat = 0.2;
        let maximumScrollFraction : CGFloat = 0.8;
        let portraitKeyboardHeight : CGFloat = keyboardHeight ?? fixPortraitKeyboardHeight;
        let landscapeKeyboardHeight : CGFloat = keyboardHeight ?? fixLandscapeKeyboardHeight;
        
        let toViewRect: CGRect = controller.view.window!.convert(toView.bounds, from: toView)
        let viewRect: CGRect = controller.view.window!.convert(controller.view.bounds, from: controller.view!)
        let midline: CGFloat = toViewRect.origin.y + 0.5 * toViewRect.size.height
        let numerator: CGFloat = midline - viewRect.origin.y - minimumScrollFraction * viewRect.size.height
        let denominator: CGFloat = (maximumScrollFraction - minimumScrollFraction) * viewRect.size.height
        var heightFraction: CGFloat = numerator / denominator
        if heightFraction < 0.0 {
            heightFraction = 0.0
        }
        else if heightFraction > 1.0 {
            heightFraction = 1.0
        }
        if keyboardHeight != nil{
            distance = floor(Double(keyboardHeight! * heightFraction))
        }else{
            let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
            if orientation == .portrait || orientation == .portraitUpsideDown {
                distance = floor(Double(portraitKeyboardHeight * heightFraction))
            }
            else {
                distance = floor(Double(landscapeKeyboardHeight * heightFraction))
            }
        }
        var viewFrame: CGRect = controller.view.frame
        viewFrame.origin.y -= CGFloat(distance)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(Double(duration))
        controller.view!.frame = viewFrame
        UIView.commitAnimations()
    }
    
    static func animateDismissSetFocus(_ controller: UIViewController, distance: inout Double){
        var viewFrame: CGRect = controller.view.frame
        viewFrame.origin.y += CGFloat(distance)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(Double(keyboardAnimationDuration));
        controller.view!.frame = viewFrame
        UIView.commitAnimations()
    }
    
    static func animateKeyboardFollowUp (_ controller: UIViewController, distance: inout Double, change: Double) {
        var viewFrame: CGRect = controller.view.frame
        viewFrame.origin.y -= CGFloat(change)
        distance += change;
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(Double(keyboardAnimationDuration));
        controller.view!.frame = viewFrame
        UIView.commitAnimations()
    }
    
    static func animateKeyboardFollowUp (_ controller: UIViewController, distance: inout Double, newDistance: Double) {
        var viewFrame: CGRect = controller.view.frame
        viewFrame.origin.y -= CGFloat(newDistance - distance);
        distance = newDistance;
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(Double(keyboardAnimationDuration));
        controller.view!.frame = viewFrame
        UIView.commitAnimations()
    }
    
    static func labelPerfectHeight (_ mylabel : UILabel, textToFit : String = "")->CGFloat {
        var str = textToFit;
        if (str == "") {
            str = mylabel.text ?? "";
        }
        
        return str.boundingRect(with: CGSize(width: mylabel.frame.size.width, height: 10000), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: mylabel.font], context: nil).size.height;
        
    }
    
    static func showAlertMenu (_ viewController: UIViewController, title: String? = nil, message: String? = nil, choices: [String]?, styles: [UIAlertActionStyle?] = [], icons: [UIImage?]? = nil, addCancel : Bool = true, callback: ((Int)->Void)?) {
        guard let choices = choices else { return; }
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        var useStyle = UIAlertActionStyle.default;
        for i in 0..<choices.count {
            var contextStyle = useStyle;
            if (i < styles.count) {
                if (styles[i] != nil) { useStyle = styles[i]!; }
                if isSubStrExists(choices[i], findFor: "delete") || isSubStrExists(choices[i], findFor: "erase") { contextStyle = .destructive; }
                if isSubStrExists(choices[i], findFor: "cancel") { contextStyle = .cancel; }
            }
            let act: UIAlertAction = UIAlertAction(title:choices[i], style: contextStyle, handler: {(action: UIAlertAction) -> Void in
                if (callback != nil) { callback! (i); }
            });
            if let image = icons?[safe: i] { act.setValue(image as Any, forKey: "image"); }
            alert.addAction(act)
        }
        
        if (addCancel) {
            let act: UIAlertAction = UIAlertAction(title:"Cancel", style: .cancel, handler: {(action: UIAlertAction) -> Void in
                if (callback != nil) { callback! (choices.count); }
            });
            alert.addAction(act)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func mainThread (_ callback: @escaping (()->Void)) {
        DispatchQueue.main.async {
            callback();
        }
    }
    
    static func backgroundThread (_ callback: @escaping (()->Void)) {
        DispatchQueue.global().async {
            callback();
        }
    }
    
    static func isSubStrExists (_ mainStr: String, findFor: String) -> Bool {
        let str = mainStr.lowercased();
        let substr = findFor.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if str.range(of: substr) != nil { return true; } else { return false; }
    }
    
    static func convertDictToArray (_ dict: Dictionary<String, AnyObject>) -> Array<Dictionary<String, AnyObject>> {
        return Array(dict.values) as! Array<Dictionary<String, AnyObject>>;
    }
    
    static func getArrFrom (_ jsonOpt: AnyObject?) -> Arr? {
        guard let json = jsonOpt else { return nil; }
        if let dict = json as? Dict {
            if let data = dict["data"] as? Arr { return data; }
            else { return nil; }
        }
        else if let arr = json as? Arr { return arr; }
        else { return nil; }
                
    }

    static func getDictFrom (_ jsonOpt: AnyObject?) -> Dict? {
        guard let json = jsonOpt else { return nil; }
        if let dict = json as? Dict {
            if let data = dict["data"] as? Dict { return data; }
            else { return dict; }
        }
        else { return nil; }
        
    }
    
    static func animateSetFocusNew(_ controller: UIViewController, toView: UIView, distance: inout Double, duration: CGFloat = keyboardAnimationDuration, keyboardHeight : CGFloat?){
        let minimumScrollFraction : CGFloat = 0.2;
        let maximumScrollFraction : CGFloat = 0.8;
        let portraitKeyboardHeight : CGFloat = 216;
        let landscapeKeyboardHeight : CGFloat = 162;
        
        let toViewRect: CGRect = controller.view.window!.convert(toView.bounds, from: toView)
        let viewRect: CGRect = controller.view.window!.convert(controller.view.bounds, from: controller.view!)
        let midline: CGFloat = toViewRect.origin.y + 0.5 * toViewRect.size.height
        let numerator: CGFloat = midline - viewRect.origin.y - minimumScrollFraction * viewRect.size.height
        let denominator: CGFloat = (maximumScrollFraction - minimumScrollFraction) * viewRect.size.height
        var heightFraction: CGFloat = numerator / denominator
        if heightFraction < 0.0 {
            heightFraction = 0.0
        }
        else if heightFraction > 1.0 {
            heightFraction = 1.0
        }
        if keyboardHeight != nil{
            distance = floor(Double(keyboardHeight! * heightFraction))
        }else{
            let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
            if orientation == .portrait || orientation == .portraitUpsideDown {
                distance = floor(Double(portraitKeyboardHeight * heightFraction))
            }
            else {
                distance = floor(Double(landscapeKeyboardHeight * heightFraction))
            }
        }
        var viewFrame: CGRect = controller.view.frame
        viewFrame.origin.y -= CGFloat(distance)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(Double(duration))
        controller.view!.frame = viewFrame
        UIView.commitAnimations()
    }
    
    static func animateDismissSetFocusNew(_ controller: UIViewController, distance: inout Double){
        var viewFrame: CGRect = controller.view.frame
        viewFrame.origin.y += CGFloat(distance)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(Double(keyboardAnimationDuration))
        controller.view!.frame = viewFrame
        UIView.commitAnimations()
    }
    
    private static func iterate (view: UIView, level: Int = 0, operation: ((UIView)->Void)) {
        for el in view.subviews {
            operation(el);
            iterate(view: el, level: level + 1, operation: operation);
        }
    }
    
    static func iterateOverAllElements (view: UIView, operation: ((UIView)->Void)) {
        iterate(view: view, operation: operation);
    }
    
    static func iterateOverAllElements (view: UIView, operation: ((UIView)->Void), whenDone: (()->Void)) {
        iterate(view: view, operation: operation);
        whenDone();
    }
    
    static func findMostBottomMargin (view: UIView, callback: ((CGFloat)->Void)) {
        var result : CGFloat = 0;
        iterateOverAllElements(view: view,
                               operation: { result = max(result, $0.bottom); },
                               whenDone: { callback (result); });
    }
    
    static func changeColorOfAllPlaceholder (inView: UIView?, toColor: UIColor?) {
        guard let inView = inView, let toColor = toColor else { return; }
        self.iterateOverAllElements(view: inView) { thisView in
            let color = [NSAttributedStringKey.foregroundColor: toColor];
            if let tf = thisView as? UITextField {
                tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder ?? "", attributes: color);
            }
        }

    }
    
    
}
