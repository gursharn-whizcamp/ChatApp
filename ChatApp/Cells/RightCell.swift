//
//  RightCell.swift
//  ChatApp
//
//  Created by apple on 26/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class RightCell: UITableViewCell {
    @IBOutlet weak var right_lbl: UILabel!
    @IBOutlet weak var right_view: UIView!
    @IBOutlet weak var tick_btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
