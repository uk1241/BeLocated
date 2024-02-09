//
//  MailDetailsTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 31/08/23.
//

import UIKit

class MailDetailsTableViewCell: UITableViewCell {
    @IBOutlet var continueButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        continueButton.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
    
}
