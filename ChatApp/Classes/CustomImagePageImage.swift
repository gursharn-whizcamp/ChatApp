//
//  CustomImagePageImage.swift
//  KIV_DeliveryApp
//
//  Created by apple on 21/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CustomImagePageImage: UIPageControl {
    let activeImage:UIImage = UIImage(named: "SelectedPage")!
     let inactiveImage:UIImage = UIImage(named: "UnselectPage")!

     override func awakeFromNib() {
           super.awakeFromNib()

           self.pageIndicatorTintColor = UIColor.clear
           self.currentPageIndicatorTintColor = UIColor.clear
           self.clipsToBounds = false
      }

      func updateDots() {
           var i = 0
           for view in self.subviews {
               if let imageView = self.imageForSubview(view) {
                   if i == self.currentPage {
                       imageView.image = self.activeImage
                   } else {
                       imageView.image = self.inactiveImage
                   }
                   i = i + 1
               } else {
                   var dotImage = self.inactiveImage
                   if i == self.currentPage {
                       dotImage = self.activeImage
                   }
                   view.clipsToBounds = false
                   view.addSubview(UIImageView(image:dotImage))
                   i = i + 1
               }
           }
       }

       fileprivate func imageForSubview(_ view:UIView) -> UIImageView? {
           var dot:UIImageView?

           if let dotImageView = view as? UIImageView {
               dot = dotImageView
           } else {
               for foundView in view.subviews {
                   if let imageView = foundView as? UIImageView {
                       dot = imageView
                       break
                   }
               }
           }

           return dot
       }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
