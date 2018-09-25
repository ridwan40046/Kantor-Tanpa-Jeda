//
//  Whisper+Function.swift
//  Family Tree
//
//  Created by Martin Tjandra on 1/29/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import Whisper

func topViewController() -> UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate;
    let navcon = app.window?.rootViewController as! UINavigationController;
    let vc = navcon.viewControllers.last!;
    return vc;
}

func announce (_ title: String?, text: String? = nil, image: UIImage? = nil, duration: TimeInterval? = nil, color: UIColor? = nil, callback: (()->Void)? = nil) {
    let announcement = Announcement(title: title ?? "", subtitle: text, image: image, duration: duration ?? 5, action: callback);
    Whisper.show(shout: announcement, to: topViewController(), completion: nil);
}

func whistle (_ title: String?, duration: TimeInterval? = nil) {
    guard let title = title else { return; }
    Whisper.show(whistle: Murmur(title: title), action: .show(duration ?? 5));
}

func whistleError (_ title: String?, duration: TimeInterval? = nil) {
    guard let title = title else { return; }
    Whisper.show(whistle: Murmur(title: title, backgroundColor: UIColor.red, titleColor: UIColor.white), action: .show(duration ?? 5));
}
