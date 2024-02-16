//
//  PersonalDetailsTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 31/08/23.
//

import UIKit
import SkyFloatingLabelTextField
class PersonalDetailsTableViewCell: UITableViewCell {
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var signIn: UIButton!
    @IBOutlet weak var whyWeBackgroundView: UIView!
    @IBOutlet weak var datePickerBtnOutlet: UIButton!
    @IBOutlet weak var textLabelFor: UILabel!
    @IBOutlet weak var dateTextFld: SkyFloatingLabelTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        continueBtn.makeRounded()
        whyWeBackgroundView.ThreeColorGradient()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func signInButtonTapped()
        {

        }
    
}
