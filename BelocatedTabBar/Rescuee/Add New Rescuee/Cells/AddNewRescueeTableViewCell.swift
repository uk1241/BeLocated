//
//  AddNewRescueeTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 06/10/23.
//

import UIKit

class AddNewRescueeTableViewCell: UITableViewCell {
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var rescueeTypeLabel : UILabel!
    @IBOutlet weak var rescueTypeIMage: UIImageView!
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
