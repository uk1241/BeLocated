//
//  AlertTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 08/07/23.
//

import UIKit

class AlertTableViewCell: UITableViewCell {
    @IBOutlet var alertBgView: UIView!
    @IBOutlet var alertNameBgView: UIView!
    @IBOutlet var viewDetailsBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        alertBgView.addCornerRadius(24.0)
        alertNameBgView.addCornerRadius(16.0)
        viewDetailsBtn.makeRounded()
    }

//    override func layoutSubviews() {
////        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
