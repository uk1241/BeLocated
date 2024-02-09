//
//  contactDetailsTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 31/08/23.
//

import UIKit

class contactDetailsTableViewCell: UITableViewCell {
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet weak var whyWeBackgroundView: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        continueBtn.makeRounded()
        whyWeBackgroundView.applyGradient()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
