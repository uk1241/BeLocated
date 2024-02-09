//
//  AlertDetailsViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 11/07/23.
//

import UIKit

class AlertDetailsViewController: UIViewController {
    @IBOutlet var rescueeView: UIView!
    @IBOutlet var supportCastView: UIView!
    @IBOutlet var alertDetailsBgView: UIView!
    @IBOutlet var terminateAlertBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        
    }
    
    @IBAction func terminateAlertBtnAction(_ sender: Any)
    {
        
        
        
    }
    
    
    
}
