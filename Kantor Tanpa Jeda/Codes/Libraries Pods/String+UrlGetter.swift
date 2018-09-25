//
//  String+UrlGetter.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 08/06/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension String {
    
    func getImage(callback: ((UIImage?)->Void)?) {
        guard let url = URL(string: self) else { callback?(nil); return; }
        KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) -> () in callback?(image); }
    }
    
}
