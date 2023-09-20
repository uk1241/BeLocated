//
//  RescueeTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 08/07/23.
//

import UIKit

class RescueeTableViewCell: UITableViewCell {

    @IBOutlet weak var rescueebgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        rescueebgView.addCornerRadius(16.0)
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
