//
//  SupportCastViewController.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 08/07/23.
//

import UIKit

class SupportCastViewController: UIViewController {

    @IBOutlet var suportCastSegmentControl: YourSegmentedControl!
    @IBOutlet var supportCastTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigationBar()
        suportCastSegmentControl.applyCustomStyle(borderColorHex: "#FFCD00")
        suportCastSegmentControl.layer.cornerRadius = suportCastSegmentControl.bounds.height/2
        self.suportCastSegmentControl.layer.masksToBounds = true
        suportCastSegmentControl.clipsToBounds = true
        supportCastTableView.register(UINib(nibName: "SupportCastTableViewCell", bundle: nil), forCellReuseIdentifier: "SupportCastTableViewCell")
    }
}
extension SupportCastViewController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupportCastTableViewCell", for: indexPath) as! SupportCastTableViewCell
        return cell
    }
    
    
}
