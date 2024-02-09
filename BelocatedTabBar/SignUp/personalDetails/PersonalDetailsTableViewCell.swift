//
//  PersonalDetailsTableViewCell.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 31/08/23.
//

import UIKit

class PersonalDetailsTableViewCell: UITableViewCell {
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var signIn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        continueBtn.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func signInButtonTapped()
        {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let SignUpVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! SignUpViewController
//
//            if let navigationController = self.navigationController {
//                navigationController.pushViewController(SignUpVc, animated: true)
//            }
        }
    
}
