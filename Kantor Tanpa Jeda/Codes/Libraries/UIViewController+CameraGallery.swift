//
//  UIViewController+CameraGallery.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 12/11/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation
import UIKit
import Toaster

var openCameraGalleryHandler = OpenCameraGalleryHandler();

extension UIViewController {

    func openCamera (callback: ((UIImage?)->Void)?) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            openCameraGalleryHandler.set(callback: callback)
            let picker = UIImagePickerController()
            picker.delegate = openCameraGalleryHandler;
            picker.sourceType = .camera
            picker.allowsEditing = true
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .popover
            self.present(picker, animated: true, completion: nil)
        }
        else {
            toast ("Access to camera is not available");
        }
    }
    
    
    func openGallery(callback: ((UIImage?)->Void)?){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            openCameraGalleryHandler.set(callback: callback)
            let picker = UIImagePickerController()
            picker.delegate = openCameraGalleryHandler;
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            self.present(picker, animated: true, completion: nil)
            picker.modalPresentationStyle = .popover
        }
        else {
            toast ("Access to gallery is not available");
        }
    }
    

}

class OpenCameraGalleryHandler: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var callback: ((UIImage?)->Void)?

    func set (callback: ((UIImage?)->Void)?) {
        self.callback = callback;
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        callback?(pickedImage);
        picker.dismiss(animated: true, completion: nil)
    }
    
}
