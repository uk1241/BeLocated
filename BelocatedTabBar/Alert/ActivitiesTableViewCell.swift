//
//  ActivitiesTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 10/07/23.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    @IBOutlet var activitiesBgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        activitiesBgView.addCornerRadius(16.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
