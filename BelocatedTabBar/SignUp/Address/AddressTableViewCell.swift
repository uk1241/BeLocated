//
//  AddressTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 01/09/23.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet var getcurrentLoactionButton: UIButton!
    @IBOutlet var addAddressManualBtn: UIButton!
    @IBOutlet weak var whyweAskBackgroundView: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        getcurrentLoactionButton.makeRounded()
        addAddressManualBtn.makeRounded()
        addAddressManualBtn.layer.borderWidth = 1
        addAddressManualBtn.layer.borderColor = UIColor.init(hexString: "#A28200")?.cgColor
        whyweAskBackgroundView.applyGradient()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
