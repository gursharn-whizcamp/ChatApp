//
//  PhotoManager.swift
//  ImageComponentDemo
//  AutoForce
//
//  Created by Apple2 on 20/08/19.
//  Copyright © 2019 Apple2. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

typealias PhotoTakingHelperCallback = ((UIImage?,URL?) -> Void)
typealias CallbackwithURL = ((UIImage?) -> Void)

enum ImagePickerOptions: Int {
    case Camera
    case Gallery
}

private struct constant {
    static let actionTitle = "Choose From"
    static let actionMessage = "Please select an option to choose image"
    static let cameraBtnTitle = "Take Picture"
    static let galeryBtnTitle = "Select from Gallery"
    static let cancelBtnTitle = "Cancel"
}

@objc class PhotoManager:NSObject {
    
    let imagePicker = UIImagePickerController()
    internal var navController: UINavigationController!
    internal var callback: PhotoTakingHelperCallback!
    var allowEditing: Bool
    
    /*
     Intialize the navController from give reference of navigationcontroller while creating Photomanager class object.
     Callback: Callback will be call after the picking image.
     */
    init(navigationController:UINavigationController, allowEditing:Bool ,videoType:Bool, callback:@escaping PhotoTakingHelperCallback) {
        self.navController = navigationController
        self.callback = callback
        self.allowEditing = allowEditing
        if videoType == true{
           imagePicker.mediaTypes = ["public.movie"]
        }else{
            imagePicker.mediaTypes = ["public.image"]
        }
        super.init()
        
        //presentActionSheet()
        
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if authorizationStatus == .notDetermined {//First Time
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
                if granted {
                    print("access granted")
                    DispatchQueue.main.async {
                          self.presentActionSheet()
                    }
                }
                else {
                    print("access denied")
                    self.showSettingsPopup(alertTitle: "Camera permission is required. Please allow camera access in the settings." )
                }
            }
        }
        else {//After user gives permissions
            if checkPhotoLibraryPermission() == true {
                DispatchQueue.main.async {
                    self.presentActionSheet()
                }
            }else{
                DispatchQueue.main.async {
                    self.showSettingsPopup(alertTitle: "Photo gallery permission is required. Please allow photo access in the settings.")
                }
            }
        }
    }
    
    
    //MARK: Goto settings to turn on permissions
    func showSettingsPopup(alertTitle : String) {
        var alertController = UIAlertController()
        alertController = UIAlertController(title: nil, message: alertTitle, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        
        
        let cancelButton = UIAlertAction(title: constant.cancelBtnTitle, style: .cancel, handler: { (action) -> Void in
            
        })
        alertController.addAction(cancelButton)
        
        navController.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: ImagePicker Custom Functions
    ///Presenting sheet with option to select image source
    
    private func presentActionSheet() {
        
        var alertController = UIAlertController()
        
        alertController = UIAlertController(title: constant.actionTitle, message: constant.actionMessage, preferredStyle: .actionSheet)
        
        //commented for take picture
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            let cameraButton = UIAlertAction(title: constant.cameraBtnTitle, style: .default, handler: { (action) -> Void in
                self.presentUIimagePicker(type: .camera)
            })
            alertController.addAction(cameraButton)
        }
        
        let  galleryButton = UIAlertAction(title: constant.galeryBtnTitle, style: .default, handler: { (action) -> Void in
            self.presentUIimagePicker(type: .photoLibrary)
        })
        alertController.addAction(galleryButton)
        
        let cancelButton = UIAlertAction(title: constant.cancelBtnTitle, style: .cancel, handler: { (action) -> Void in
            self.callback(nil,nil)
        })
        alertController.addAction(cancelButton)
        navController.present(alertController, animated: true, completion: nil)
    }
    
    
    private func checkPhotoLibraryPermission()-> Bool {
        
        var isEnabled = false
        //Photos
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    isEnabled = true
                } else {
                     isEnabled = false
                }
            })
        }else if photos == .authorized{
             isEnabled = true
        }
        
        return isEnabled
    }
    
    /*
     presentUIimagePicker will present the UIImagePicker with give type
     type: Camera or Gallery
     controller: UINavigationcontroller, navigationcontroller on with uiimagepicker will present.
     */
    private func presentUIimagePicker(type: UIImagePickerController.SourceType){
        imagePicker.allowsEditing = self.allowEditing
        imagePicker.sourceType = type
        imagePicker.delegate = self
        imagePicker.videoQuality = .typeIFrame1280x720
        imagePicker.modalPresentationStyle = .overCurrentContext
        navController.present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: ------------------------Class End------------------------------------



//MARK: ------------------------Class Extension------------------------------------

/*Extension for UIImagePickerControllerDelegate & UINavigationControllerDelegate
 
 
 */
extension PhotoManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navController.dismiss(animated: true) {
              let imageURL = info[.imageURL] as? URL
            print(imageURL)
            if self.allowEditing {
                if let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL{
                    self.callback(nil,videoURL)
                }else{
                    if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                        self.callback(pickedImage,nil)
                    }
                }
            }
            else{
                if let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL{
                    self.callback(nil,videoURL)
                }else{
                    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                        self.callback(pickedImage,nil)
                    }
                }
            }
        }
      
        //navController.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.callback(nil,nil)
        navController.dismiss(animated: true, completion: nil)
    }
}
