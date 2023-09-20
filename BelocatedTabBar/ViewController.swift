//
//  ViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 07/07/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet var beLocatedTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
//        beLocatedTabBar.isTranslucent = true
        beLocatedTabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        navigationController?.isNavigationBarHidden = true
//        beLocatedTabBar.backgroundColor = UIColor.blue
    }


}

