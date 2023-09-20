//
//  ProfileViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 01/09/23.
//

import UIKit
class ProfileViewController: UIViewController {
    @IBOutlet var profileBg: UIView!
    @IBOutlet var expandbtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
//        profileBg.clipsToBounds = true
        profileBg.layer.cornerRadius = 24
        profileBg.layer.maskedCorners = [.layerMaxXMinYCorner]
        expandbtn.addTarget(self, action: #selector(animate), for: .touchUpInside)
    }
    @objc func animate()
    {
        
        let initialYHeight = self.view.frame.height
        let initialHeight = 556
        
        // Define the final positions for the view
        let finalYPosition = self.view.frame.height
        let finalHeight = 275

        // Set the final position and size of the view
        profileBg.frame.origin.y = finalYPosition
        profileBg.frame.size.height = CGFloat(finalHeight)
    }
    @objc func setConstantSize() {
        // Define the initial and final positions for the animation
        let initialYPosition = self.view.frame.height
        let finalYPosition = self.view.frame.height - 275 // Calculate the final Y position
        let finalHeight = 275

        // Set the initial position and size of the view
        profileBg.frame.origin.y = initialYPosition
        profileBg.frame.size.height = 0 // Initially, set the height to 0

        // Perform the animation
        UIView.animate(withDuration: 100) {
            self.profileBg.frame.origin.y = finalYPosition
            self.profileBg.frame.size.height = CGFloat(finalHeight)
        }


//        profileBg.frame = CGRect(x: 0, y: 0, width: 375, height: 245)
    }

}
