//
//  UiNibsFilesCreation.swift
//  KIV_DeliveryApp
//
//  Created by apple on 15/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

class UINibCreation{
    static func loadUrgentMessageView()-> UrgentMessageView {
     return Bundle.main.loadNibNamed("UrgentMessageView", owner:nil, options:nil)![0] as! UrgentMessageView
    }
//    static func loadsuccessPopup()-> SuccessForgotPopup {
//      return Bundle.main.loadNibNamed("SuccessForgotPopup", owner:nil, options:nil)![0] as! SuccessForgotPopup
//    }
//    static func loadDispatchPopup()-> DispatchView {
//      return Bundle.main.loadNibNamed("DispatchView", owner:nil, options:nil)![0] as! DispatchView
//    }
//    static func loadSubmitReviewPopup()-> SubmitReview {
//      return Bundle.main.loadNibNamed("SubmitReview", owner:nil, options:nil)![0] as! SubmitReview
//    }
//    static func loadAcceptRejectViewPopup()-> AcceptRejectView {
//      return Bundle.main.loadNibNamed("AcceptRejectView", owner:nil, options:nil)![0] as! AcceptRejectView
//    }
//    static func loadNewJobViewPopup()-> NewJobView {
//      return Bundle.main.loadNibNamed("NewJobView", owner:nil, options:nil)![0] as! NewJobView
//    }
//    static func loadPickupViewPopup()-> PickupView {
//      return Bundle.main.loadNibNamed("PickupView", owner:nil, options:nil)![0] as! PickupView
//    }
//    static func loadCongratulationScreenPopup()-> CongratulationScreen {
//      return Bundle.main.loadNibNamed("CongratulationScreen", owner:nil, options:nil)![0] as! CongratulationScreen
//    }
//    static func loadCongratulationWalletScreenPopup()-> SuccessWalletView {
//      return Bundle.main.loadNibNamed("SuccessWalletView", owner:nil, options:nil)![0] as! SuccessWalletView
//    }
//    static func loadLocationPopupView()-> LocationPopupView {
//         return Bundle.main.loadNibNamed("LocationPopupView", owner:nil, options:nil)![0] as! LocationPopupView
//       }
//    static func loadCurrentLocationPopupView()-> CurrentLocationPopupView {
//      return Bundle.main.loadNibNamed("CurrentLocationPopupView", owner:nil, options:nil)![0] as! CurrentLocationPopupView
//    }
}
