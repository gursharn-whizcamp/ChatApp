//
//  ChatCell.swift
//  ChatApp
//
//  Created by apple on 23/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    @IBOutlet weak var imgvw: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var message_lbl: UILabel!
    @IBOutlet weak var time_lbl: UILabel!
    @IBOutlet weak var countBackgroundView: UIView!
    @IBOutlet weak var count_lbl: UILabel!
    @IBOutlet weak var onlineView: UIView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
