//
//  FontLabels.swift
//  PetConnect
//
//  Created by 42Works-Worksys2 on 21/09/17.
//  Copyright © 2017 42works. All rights reserved.
//


import UIKit
import Foundation
//MARK:- Label classes

class SemiBoldLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "JosefinSans-SemiBold", size: self.font.pointSize) ?? UIFont.systemFont(ofSize: self.font.pointSize)
    }
}

class LightLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "JosefinSans-Light", size: self.font.pointSize) ?? UIFont.systemFont(ofSize: self.font.pointSize)
    }
}


class RegularLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "JosefinSans-Regular", size: self.font.pointSize) ?? UIFont.systemFont(ofSize: self.font.pointSize)
        self.textColor = UIColor.lightGray//AppColor.colorGrey
    }
}

class LightLabelWithColor: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "Roboto-Light", size: self.font.pointSize) ?? UIFont.systemFont(ofSize: self.font.pointSize)
        self.textColor = UIColor.lightGray//AppColor.lightTextColor
    }
}

class MediumLabelWithColor: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "Roboto-Medium", size: self.font.pointSize) ?? UIFont.systemFont(ofSize: self.font.pointSize)
        self.textColor = UIColor.lightGray//AppColor.darktextColor
    }
}

class BoldLabelWithColor: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "Roboto-Bold", size: self.font.pointSize) ?? UIFont.systemFont(ofSize: self.font.pointSize)
        self.textColor = UIColor.lightGray//AppColor.darktextColor
    }
}

//MARK:- Button classes

class RegularButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.titleLabel?.font = UIFont.init(name: "JosefinSans-Regular", size: self.titleLabel?.font.pointSize ?? 10) ?? UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? 10)
    }
}


class BoldButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.titleLabel?.font = UIFont.init(name: "Roboto-Bold", size: self.titleLabel?.font.pointSize ?? 10) ?? UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? 10)
    }
}

class MediumButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.titleLabel?.font = UIFont.init(name: "Roboto-Medium", size: self.titleLabel?.font.pointSize ?? 10) ?? UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? 10)
    }
}

class LightButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.titleLabel?.font = UIFont.init(name: "Roboto-Light", size: self.titleLabel?.font.pointSize ?? 10) ?? UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? 10)
    }
}

class RobotoMediumButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = UIColor.lightGray//AppColor.gradientPinkColor
        self.titleLabel?.font = UIFont.init(name: "Roboto-Medium", size: self.titleLabel?.font.pointSize ?? 10) ?? UIFont.systemFont(ofSize: self.titleLabel?.font.pointSize ?? 10)
    }
}

//MARK:- Textfield classes
class RegularTextField: UITextField {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "JosefinSans-Regular", size: self.font?.pointSize ?? 14) ?? UIFont.systemFont(ofSize: self.font?.pointSize ?? 14)
        self.textColor = UIColor.lightGray//AppColor.colorGrey
        //self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: AppColor.colorGrey])
    }
}


class RegularTextView: UITextView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "JosefinSans-Regular", size: self.font?.pointSize ?? 14) ?? UIFont.systemFont(ofSize: self.font?.pointSize ?? 14)
        self.textColor = UIColor.lightGray//AppColor.colorGrey
        //self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: AppColor.colorGrey])
    }
}


class RegularWithPaddingTextField: UITextField {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont.init(name: "SF Pro Display Medium", size: self.font?.pointSize ?? 17) ?? UIFont.systemFont(ofSize: self.font?.pointSize ?? 10)
        self.textColor = UIColor.black
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class LoginTextField: UITextField {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.font = UIFont.init(name: "Roboto-Light", size: 28) ?? UIFont.systemFont(ofSize: 25)
        }else {
            self.font = UIFont.init(name: "Roboto-Light", size: 17) ?? UIFont.systemFont(ofSize: 17)
        }
        self.textColor = UIColor.white
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}

//    extension UIView {
//
//        func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat){
//                let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//                let mask = CAShapeLayer()
//                mask.path = path.cgPath
//                view.layer.mask = mask
//        }
        
//       func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//            let mask = CAShapeLayer()
//            mask.path = path.cgPath
//            layer.mask = mask
//        }
   // }
extension UIView {

    func roundCorners(corners:UIRectCorner, radius: CGFloat) {

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
class RoundedCornerView: UIView {

    var cornerRadiusValue : CGFloat = 0
    var corners : UIRectCorner = []
    
    @IBInspectable var shadow: Bool {
           get {
               return layer.shadowOpacity > 0.0
           }
           set {
               if newValue == true {
                   self.addShadow()
               }
           }
       }

    @IBInspectable  var cornerRadius: CGFloat {
           get {
               return self.layer.cornerRadius
           }
           set {
               self.layer.cornerRadius = newValue

               // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
               if shadow == false {
                   self.layer.masksToBounds = true
               }
           }
       }


       func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                  shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                  shadowOpacity: Float = 0.4,
                  shadowRadius: CGFloat = 3.0) {
           layer.shadowColor = shadowColor
           layer.shadowOffset = shadowOffset
           layer.shadowOpacity = shadowOpacity
           layer.shadowRadius = shadowRadius
       }
    
    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    @IBInspectable var shadowOffset: CGSize{
           get{
               return self.layer.shadowOffset
           }
           set{
               self.layer.shadowOffset = newValue
           }
       }
    @IBInspectable var borderWidth: CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor{
        get{
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
       @IBInspectable var shadowColor: UIColor{
           get{
               return UIColor(cgColor: self.layer.shadowColor!)
           }
           set{
               self.layer.shadowColor = newValue.cgColor
           }
       }

    @IBInspectable  var shadowRadius: CGFloat{
           get{
               return self.layer.shadowRadius
           }
           set{
               self.layer.shadowRadius = newValue
           }
       }

       @IBInspectable var shadowOpacity: Float{
           get{
               return self.layer.shadowOpacity
           }
           set{
               self.layer.shadowOpacity = newValue
           }
       }
}

/*
class CustomTextField: SkyFloatingLabelTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setFont_Color()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setFont_Color()
    }
    
    private func setFont_Color() {
        self.font = UIFont.init(name: "Roboto-Regular", size: 15) ?? UIFont.systemFont(ofSize: 15)
        self.textColor = UIColor.white
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.placeholderColor = UIColor.white
        self.titleColor = UIColor.white
        self.lineColor = UIColor.white
        self.selectedTitleColor = UIColor.white
        self.selectedLineColor = UIColor.white
       
    }
}

class DarkLabelTextField: SkyFloatingLabelTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setFont_Color()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setFont_Color()
    }
    
    private func setFont_Color() {
        self.font = UIFont.init(name: "Roboto-Regular", size: 15) ?? UIFont.systemFont(ofSize: 15)
        self.textColor = AppColor.darktextColor
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.placeholderColor = AppColor.lightTextColor
        self.titleColor = AppColor.lightTextColor
        self.lineColor = AppColor.dividerColor
        self.selectedTitleColor = AppColor.lightTextColor
        self.selectedLineColor = AppColor.dividerColor
        self.errorColor = UIColor.red
    }
}

class UnselectedTextField: SkyFloatingLabelTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setFont_Color()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setFont_Color()
    }
    
    private func setFont_Color() {
        self.font = UIFont.init(name: "Roboto-Regular", size: 15) ?? UIFont.systemFont(ofSize: 15)
        self.textColor = AppColor.lightTextColor
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.placeholderColor = AppColor.lightTextColor
        self.titleColor = AppColor.lightTextColor
        self.selectedTitleColor = AppColor.lightTextColor
        self.lineColor = AppColor.dividerColor
        self.selectedLineColor = AppColor.dividerColor
        self.errorColor = UIColor.red
    }
}

*/
