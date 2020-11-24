//
//  LoaderView.swift
//  Pawxo
//
//  Created by 42works on 03/02/20.
//  Copyright © 2020 42works. All rights reserved.
//

import Foundation
import UIKit


class  LoaderView{
    
    var loader = UIImageView()
    var loaderView = UIView()
    var mainView = UIView()
    
    static let shared = LoaderView()
    
    
    func showLoader(message: String = "Please wait") {
        
        
        let window = UIApplication.shared.keyWindow!
        
            if kAppDelegate.window!.contains(loaderView)
            {
                self.hideLoader()
            }
        loader.isHidden = false
        loaderView.isHidden = false
        mainView.isHidden = false
        loaderView.frame = (CGRect(x: kAppDelegate.window!.frame.size.width/2 - 45 , y: kAppDelegate.window!.frame.size.height/2 - 45 , width: 90, height: 90))
        loaderView.backgroundColor = UIColor.white
        loaderView.layer.cornerRadius = 10
        let gif = UIImage.gifImageWithName("gif")
        loader.center = loaderView.center
        loader = UIImageView(frame: CGRect(x: 10, y: 10, width: 70, height: 70))
        loader.image = gif
        loader.isHidden = false
        loaderView.addSubview(loader)
        mainView.backgroundColor = UIColor.white//AppColor.colorBackground
        mainView.frame = kAppDelegate.window!.bounds
        mainView.addSubview(loaderView)
        kAppDelegate.window!.addSubview(mainView)
        
//        if let viewController = (((UIApplication.shared.keyWindow?.rootViewController as! UINavigationController)).topViewController){
//            viewController.view.addSubview(mainView)
//        }
        
    }
    
     func hideLoader() {
        loader.isHidden = true
        loaderView.isHidden = true
        mainView.removeFromSuperview()
        mainView.isHidden = true
        loader.removeFromSuperview()
        loaderView.removeFromSuperview()
         
    }
    
}
