//
//  GSImageViewerController+Function.swift
//  Choose My Story
//
//  Created by Martin Tjandra on 27/08/18.
//  Copyright © 2018 idesolusiasia. All rights reserved.
//

import Foundation
import UIKit
import GSImageViewerController

extension UIImageView {
    
    func show (from vc: UIViewController?) {
        guard let image = self.image, let vc = vc else { return; }
        // Create image info
        let imageInfo = GSImageInfo.init(image: image, imageMode: GSImageInfo.ImageMode.aspectFit);
        
        // Setup view controller
        let imageViewer = GSImageViewerController.init(imageInfo: imageInfo);
        imageViewer.view.backgroundColor = UIColor.groupTableViewBackground;
        // Present the view controller.
        imageViewer.show(from: vc);
    }
    
}
