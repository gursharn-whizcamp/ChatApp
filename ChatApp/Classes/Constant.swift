//
//  Constant.swift
//  KIV_DeliveryApp
//
//  Created by apple on 28/09/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

//AppDelegate
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let kDeviceType = "Ios"
let kDeviceId = UIDevice.current.identifierForVendor?.uuidString
var primaryValue = "Paypal Account"
//MARK: Limits
let kMaxPasswordLimit = 15
let kMinPasswordLimit = 6

let kToastDuration = 3.0


struct StoryboardName{
    static let login = "Login"
    static let main = "Main"
    static let Tabbar = "Tabbar"
    static let Account = "Account"
}

struct APIKey {
    static let googleKey = ""
}
struct WebServiceConstants {
}
struct DefaultImage {
}
struct AppColor {
   
}
struct ScreenSize {
    static let height = UIScreen.main.bounds.size.height
    static let width = UIScreen.main.bounds.size.width
}
struct ApiServiceName{
}
struct AppMessages {
    
static let noInternetConnection = "No internet connection. Please try again."
}

struct ValidationMessage{
static let yourName = "Please enter your name"
static let firstName = "Please enter customer's first name"
static let emptyEmail = "Please enter email address"
static let invalidEmail = "Please enter valid email address"
static let emptyUserName = "Please enter username"
static let emptyPwd = "Please enter password"
static let invalidCred = "Please enter valid credentials"
static let validPwd = "Password should be minimum 8 characters long, should contain at least one capital letter, one small letter, one number and pne special character"
static let emptyLocation = "Please enter location"
static let emptyPhone = "Please enter phone number"
static let invalidPhone = "Please enter valid phone number"
static let emptyVehicleBrand = "Please enter vehicle brand"
static let emptyVehicleName = "Please enter vehicle name"
static let emptyModelNumber = "Please enter vehicle model"
static let emptyVehicleNumber = "Please enter vehicle number"
static let emptyVehicleRegNo = "Please enter vehicle registration number"
static let emptyVehicleInsNo = "Please enter vehicle insurance number"
static let acceptTerms = "Please accept terms and conditions"
static let noPreview = "No preview available in prototype"
}

struct AlertMessages {
    //alert popup
    static let okStr = "OK"
    static let cancelStr = "Cancel"
    
    static let cancelRequestTitleStr = "Cancel Request"
   
    //logout confirmation alert title
    static let logoutTitleStr = "Logout User"
    static let logoutMsgStr = "Are you sure you want to logout?"

}
struct UserDefault {
}
struct Placeholders {
}
struct Colors {
   static let textfieldBackground = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
}

struct StaticArrays {
    static let nameArr = ["Jason statham","Augustus Miles","Axl Mair","Jermaine Duggan","Ravinder Gamble","Suhayb Good","Karson Cooley"]
    static let messageArr = ["How r you what r u doing..","what happens to you","Are you available for the meeting..","we will come tomorrow for the lunch","This is the good News , we will come..","you done your work nicely, I will send...","you done your work nicely, I will send..."]
    static let timeArr = ["9:30AM","2:30PM","3:15PM","4:05PM","5:15PM","5:18PM","6:20PM"]
    static let imageArr = [UIImage(named: "user1"),UIImage(named: "user2"),UIImage(named: "user3"),UIImage(named: "user4"),UIImage(named: "user5"),UIImage(named: "user6"),UIImage(named: "user6")]
    static let urgentNameArr = ["Jason statham","Augustus Miles","Axl Mair","Jermaine Duggan"]
    static let urgentMessageArr = ["20 unread messages from team","08 unread messages from team","01 unread messages from team","08 unread messages from team"]
    static let urgentImageArr = [UIImage(named: "user1"),UIImage(named: "user2"),UIImage(named: "user3"),UIImage(named: "user4")]
}
