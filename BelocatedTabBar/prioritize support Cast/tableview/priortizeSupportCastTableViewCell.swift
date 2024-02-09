//
//  priortizeSupportCastTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 03/08/23.
//

import UIKit

class priortizeSupportCastTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
}
