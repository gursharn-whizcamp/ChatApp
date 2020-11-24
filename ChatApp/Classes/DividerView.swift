//
//  DividerView.swift
//  GoDolly
//
//  Created by 42Works-Worksys2 on 15/05/18.
//  Copyright © 2018 42works. All rights reserved.
//

import UIKit

class DividerView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.lightGray
        self.alpha = 1.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray//AppColor.dividerColor
        self.alpha = 1.0
    }    
}

class HeaderView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.lightGray//AppColor.primaryColor
        self.alpha = 1.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray//AppColor.primaryColor
        self.alpha = 1.0
    }
}
