//
//  c.swift
//  AutoForce
//
//  Created by Apple2 on 20/08/19.
//  Copyright © 2019 Apple2. All rights reserved.
//

import Foundation
import UIKit
//import UITextView_Placeholder


typealias CompletionHandler = (_ success:Bool) -> Void

class CommonFunctions: NSObject {
 
    class func getCurrentYear() -> String? {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let nameOfYear = dateFormatter.string(from: now)
        return nameOfYear
    }
    
    //Unique Device Id
    class func getDeviceId() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    //convert from string to json dictionary
    class func convertToDictionary(text: String) -> [[String: Any]] {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] ?? [[String: Any]]()
            } catch {
                print(error.localizedDescription)
            }
        }
        return [[String: Any]]()
    }
    
    
    //---------------------------------------------
    // Getting Footer view for Tableview
    //---------------------------------------------
    class func addFooterViewForProgress(isTableViewTypeGrouped: Bool, tblView:UITableView) -> UIView {
        let width: CGFloat = ScreenSize.width
        
        let viewProgess: UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
        let objActivityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: (width/2) - 12, y: 4, width: 30, height: 30))
        objActivityIndicatorView.style = UIActivityIndicatorView.Style.gray
        objActivityIndicatorView.startAnimating()
        if !isTableViewTypeGrouped {
            objActivityIndicatorView.frame = CGRect(x: (width/2) - 30, y: 4, width: 30, height: 30)
        }
        viewProgess.addSubview(objActivityIndicatorView)
        return viewProgess;
    }
    
    //MARK: Action Sheet
    class func showActionSheet(title: String?, message: String?, options: [String], inViewController viewController: UIViewController?, completion: @escaping ((String)->())) {
        var viewContrl = viewController
        if viewContrl == nil {
            viewContrl = kAppDelegate.window?.rootViewController
        }
        
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        var index = 0
        for option in options {
            let action = UIAlertAction(title: option, style: .default, handler: { (action) in
                completion(action.title ?? "")
            })
            actionSheet.addAction(action)
            
            index += 1
        }
        
        let delete = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        })
        actionSheet.addAction(delete)
        actionSheet.view.tintColor = UIColor.red//AppColor.greenColor
        
        //Show Sheet
        viewContrl?.present(actionSheet, animated: true) {}
        
    }

    //MARK:- Show Alerts
    class func showAlert(_ viewController: UIViewController, message: String) {
        viewController.view.window?.makeToast(message, duration: kToastDuration, position: .bottom)
    }
    
    class func showLoader(_ viewController: UIViewController?) {
        if let vc = viewController {
            vc.view.makeToastActivity(.center)
        }
    }
    
    class func hideLoader(_ viewController: UIViewController?) {
        if let vc = viewController {
            vc.view.hideToastActivity()
        }
    }
    
    class func fullScreenLoaderWithTap(_ viewController: UIViewController, message: String, onCompletion:@escaping (Bool?) -> Void) {
        
        viewController.view.makeToast(message, duration: kToastDuration, point: viewController.view.center, title: nil, image: nil) { didTap in
            onCompletion(didTap)
        }
    }
    
    class func showAlertViewWithActionOnWindow(titleStr: String, messageStr: String, okBtnTitleStr:String, cncelBtnTitleStr: String?, completion: @escaping CompletionHandler)
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        
        let alertAction = UIAlertAction.init(title: okBtnTitleStr, style: .default) { (UIAlertAction) in
            completion(true)
        }
        
        alert.addAction(alertAction)
        if cncelBtnTitleStr != nil{
//            if messageStr == "Strain type first"{
//                completion(true)
//            }else{
                 alert.addAction(UIAlertAction(title: cncelBtnTitleStr!, style: UIAlertAction.Style.default, handler: nil))
//            }
           
        }
        alert.view.tintColor = UIColor.black//AppColor.greenColor
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    
    /*class func showAlertWithTextfield(titleStr:String,message:String,btnTitle:String,cancelBtnTitle:String,placeholderStr:String, completion: @escaping completionHandlerAlertWithTextField){
       /* let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.poppinsMediumFont(size: 12.0), NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleString = NSAttributedString(string: titleStr, attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedMessage")
        
//        let margin:CGFloat = 60
//        let rect = CGRect(x: 0, y: margin, width: 270 , height: 25)
//        let customView = UITextView(frame: rect)
//        customView.placeholder = placeholderStr
//        customView.backgroundColor = UIColor.clear
//        customView.tintColor = AppColor.greenColor
//        customView.font = UIFont.poppinsRegularFont(size: 12.0)

        let textView = UITextView()
                textView.placeholder = placeholderStr
                textView.backgroundColor = UIColor.clear
                textView.tintColor = AppColor.greenColor
                textView.font = UIFont.poppinsRegularFont(size: 13.0)
        textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let controller = UIViewController()
        
        var frame = controller.view.frame
        frame.origin.y = 0
        frame.size.height -= 5
        textView.frame = frame
        controller.view.addSubview(textView)
        
        alert.setValue(controller, forKey: "contentViewController")
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant:140)
        alert.view.addConstraint(height)
        
      //  present(alert, animated: true, completion: nil)
        
        let action = UIAlertAction(title: btnTitle, style: .default) { (alertAction) in
//            let textField = alert.textFields![0] as UITextField
//            textField.tintColor = .black
            completion(true,textView)
            
            print(textView.text ?? "")
        }
        let cancelAction = UIAlertAction.init(title: cancelBtnTitle, style: .cancel) { (alertAction) in
            
        }
//        alert.addTextField { (textField) in
//            textField.placeholder = placeholderStr
//        }

        //  customView.backgroundColor = UIColor.greenColor()
      //  alert.view.addSubview(customView)
        
        alert.view.tintColor = AppColor.greenColor
        alert.addAction(action)
        alert.addAction(cancelAction)
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }*/
        
        
        let alertController = UIAlertController(title: titleStr + "\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        let customView = UITextView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.placeholder = placeholderStr
        customView.backgroundColor = UIColor.clear
        customView.tintColor = AppColor.greenColor
        customView.font = UIFont.poppinsRegularFont(size: 13.0)
        alertController.view.autoresizesSubviews = true
        
        let somethingAction = UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            print(customView.text)
            completion(true,customView)
        })
        
        let cancelAction = UIAlertAction(title: cancelBtnTitle, style: UIAlertAction.Style.cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
        
        alertController.view.tintColor = AppColor.greenColor
        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)
        
        
        alertController.view.addSubview(customView)
        
        customView.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 65).isActive = true
        
        customView.rightAnchor.constraint(equalTo: alertController.view.rightAnchor, constant: -10).isActive = true
        customView.leftAnchor.constraint(equalTo: alertController.view.leftAnchor, constant: 10).isActive = true
        customView.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -50).isActive = true
       //customView.backgroundColor = UIColor.red
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    */
    
    class func showAlertViewWithAttributedMessage(attributedTitleStr:String,attributedMessageStr:String, okBtnTitleStr:String, cncelBtnTitleStr: String?, completion: @escaping CompletionHandler)
    {
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let alertAction = UIAlertAction.init(title: okBtnTitleStr, style: .default) { (UIAlertAction) in
            completion(true)
        }
        
        alert.addAction(alertAction)
        if cncelBtnTitleStr != nil{
            alert.addAction(UIAlertAction(title: cncelBtnTitleStr!, style: UIAlertAction.Style.default, handler: nil))
        }
        alert.view.tintColor = UIColor.black//AppColor.greenColor
        let attributeForTitle = NSMutableAttributedString.init(string: attributedTitleStr, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)])
        let atrributeMessageStr = NSMutableAttributedString.init(string: attributedMessageStr, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15.0)])
        let compoundedStr = NSMutableAttributedString.init()
        compoundedStr.append(attributeForTitle)
        compoundedStr.append(NSAttributedString.init(string: "\n"))
        compoundedStr.append(atrributeMessageStr)
        
        alert.setValue(compoundedStr, forKey: "attributedMessage")
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    class func showActionSheetWithActionOnWindow(titleStr: String?, messageStr: String?, firstBtnTitleStr:String, secondBtnTitleStr:String,cncelBtnTitleStr: String?, completion: @escaping CompletionHandler)
    {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.actionSheet)
        
        let alertAction = UIAlertAction.init(title: firstBtnTitleStr, style: .default) { (UIAlertAction) in
           completion(true)
        }
        
        let alertAction1 = UIAlertAction.init(title: secondBtnTitleStr, style: .default) { (UIAlertAction) in
           completion(false)
        }
        
        alert.addAction(alertAction)
        alert.addAction(alertAction1)
        if cncelBtnTitleStr != nil{
            alert.addAction(UIAlertAction(title: cncelBtnTitleStr!, style: UIAlertAction.Style.default, handler: nil))
        }
        alert.view.tintColor = .black//AppColor.greenColor
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: Empty Screen
    class func showEmptyMsg(_ message: String, superView: UIView?, align: NSTextAlignment = .center, leadingSubtract: Int = 0) {
        guard let superView = superView else {
            return
        }
        self.removeEmptyMsg(superView: superView)
        let label = UILabel()
        label.tag = -10
        label.text = message
        label.font = UIFont.poppinsRegularFont(size: 14.0)
        label.frame = CGRect(x: CGFloat(10 - leadingSubtract), y: 0.0, width: superView.frame.width - 20, height: superView.frame.height)
        label.textAlignment = align
        label.textColor = UIColor.black
        label.numberOfLines = 0
        superView.backgroundColor = .clear
        superView.addSubview(label)
    }
    
    class func showEmptyScreen(_ message: String, superView: UIView?, image: UIImage?) {
        guard let superView = superView else {
            return
        }
        CommonFunctions.removeEmptyMsg(superView: superView)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: superView.frame.width, height: superView.frame.height))
        
        view.tag = -10
        view.isUserInteractionEnabled = false

        view.backgroundColor = .white
        superView.addSubview(view)
        
        // Constraints on Outer View
        view.translatesAutoresizingMaskIntoConstraints = false
        let views = ["view": superView, "newView": view]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[view]-(<=0)-[newView]", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=0)-[newView]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views)
        superView.addConstraints(horizontalConstraints)
        superView.addConstraints(verticalConstraints)
        
        
        let emptyImage = UIImageView()
        emptyImage.tag = -10
        emptyImage.image = image
       
       
        emptyImage.backgroundColor =  .white
        
        emptyImage.contentMode = .scaleAspectFit
        view.addSubview(emptyImage)
        
        //Constraints on Image
        emptyImage.translatesAutoresizingMaskIntoConstraints = false
        let imageViews = ["view": view, "newView": emptyImage]
        //let horizontalConstraintsImage = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(<=0)-[newView(100)]", options: [.alignAllRight], metrics: nil, views: imageViews)
        let centerX = NSLayoutConstraint(item: emptyImage, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: emptyImage, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 0.6, constant: 0)
        view.addConstraints([centerX])
         view.addConstraints([centerY])
        
        if superView.tag == -1010{
            let widthImage = NSLayoutConstraint.constraints(withVisualFormat: "H:[newView(100)]", options: [], metrics: nil, views: imageViews)
            let verConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[newView(100)]", options: [], metrics: nil, views: imageViews)
            // view.addConstraints(horizontalConstraintsImage)
            view.addConstraints(widthImage)
            view.addConstraints(verConstraintsLabel)
        }else{
                let widthImage = NSLayoutConstraint.constraints(withVisualFormat: "H:[newView(150)]", options: [], metrics: nil, views: imageViews)
                let verConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[newView(150)]", options: [], metrics: nil, views: imageViews)
                
                // view.addConstraints(horizontalConstraintsImage)
                view.addConstraints(widthImage)
                view.addConstraints(verConstraintsLabel)
        }
      
        
        let label = UILabel(frame: CGRect(x: 25.0, y: emptyImage.frame.maxY, width: superView.frame.size.width - 50.0, height: superView.frame.size.height))
        label.tag = -10
        label.text = message
        label.font = UIFont.poppinsRegularFont(size: 14.0)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        view.addSubview(label)
        
        //Constraints on Image
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelViews = ["view": view, "image": emptyImage, "label": label]
        
        let imgSpaceConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "V:[image]-10-[label]", options: [], metrics: nil, views: labelViews)
        
        let bottomConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-10-|", options: [], metrics: nil, views: labelViews)
        
        let horiConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label]-10-|", options: [], metrics: nil, views: labelViews)
        
        view.addConstraints(imgSpaceConstraintsLabel)
        view.addConstraints(bottomConstraintsLabel)
        view.addConstraints(horiConstraintsLabel)
    }
    
    class func removeEmptyMsg(superView: UIView?) {
        if superView == nil {
            return
        }
        for view in superView!.subviews {
            if view.tag == -10 {
                view.removeFromSuperview()
            }
        }
    }
    
    //Get user model form defaults
//    class func getuserFromDefaults() -> User {
//        return UserDefaults.objectModelForKey(UserDefault.user)
//    }
    
    //MARK:- internet connection
    class func isInternetWorking() -> (Bool) {
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
            return true
        }else{
            print("Internet Connection not Available!")
            return false
        }
    }
    
    //MARK: Get time ago
    class func timeAgoSinceDate(date:Date, numericDates:Bool) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = (now as NSDate).earlierDate(date as Date)
        let latest = (earliest == now as Date) ? date : now as Date
        let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest as Date, options: NSCalendar.Options())
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) mins ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 min ago"
            } else {
                return "A min ago"
            }
        } else if (components.second! >= 3) {
            return "Just now"
        } else {
            return "Just now"
        }
    }
    
   class func makeDate(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
        // calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
    class func setCellShadow(cell: UITableViewCell)
    {
        cell.contentView.cornerRadius = 10.0
        cell.selectionStyle = .none
        cell.contentView.layer.shadowRadius = 5
        cell.contentView.layer.shadowOffset = CGSize(width: 1,height: 1)
        cell.contentView.layer.shadowOpacity = 1.0
        cell.contentView.layer.shadowColor = UIColor.systemGray3.cgColor
        cell.contentView.layer.masksToBounds = true
    }
    class func setViewShadow(view: UIView)
    {
        
        view.layer.shadowRadius = 7
        view.cornerRadius = 20.0
        
     //   view.layer.borderWidth = 1.0
//        view.layer.borderColor = UIColor.black.cgColor
       view.layer.shadowOffset = CGSize(width: -3,height: 3)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowColor = UIColor.systemGray3.cgColor
        view.layer.masksToBounds = false
    }
    class func setSearchViewShadow(view: UIView)
        {
            
            view.layer.shadowRadius = 7
            view.cornerRadius = 5.0
            
         //   view.layer.borderWidth = 1.0
    //        view.layer.borderColor = UIColor.black.cgColor
           view.layer.shadowOffset = CGSize(width: -3,height: 3)
            view.layer.shadowOpacity = 1.0
            view.layer.shadowColor = UIColor.systemGray3.cgColor
            view.layer.masksToBounds = false
        }
}
