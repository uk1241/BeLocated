//
//  AlertViewController.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 08/07/23.
//

import UIKit
import MKToolTip

class AlertViewController: UIViewController {
    
    @IBOutlet var alertTableView: UITableView!
    @IBOutlet var alertSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        //custom NavigationBar
        setupCustomNavigationBar()
        //SegmentControl
        alertSegmentControl.applyCustomStyle(borderColorHex: "#FFCD00")
        alertSegmentControl.layer.cornerRadius = alertSegmentControl.bounds.height/2
        self.alertSegmentControl.layer.masksToBounds = true
        alertSegmentControl.clipsToBounds = true
        //CellRegister
        alertTableView.register(UINib(nibName: "AlertTableViewCell", bundle: nil), forCellReuseIdentifier: "AlertTableViewCell")
        alertTableView.register(UINib(nibName: "ActivitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivitiesTableViewCell")
        alertTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        
        tabBarController?.tabBar.isHidden = false
        
    }
    @IBAction func segmentAction(_ sender: Any)
    {
        if alertSegmentControl.selectedSegmentIndex == 0
        {
            alertTableView.reloadData()
        }
        else
        {
            alertTableView.reloadData()
        }
    }
    @objc func viewDetailsBtnTap() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alertDetailVc = storyboard.instantiateViewController(withIdentifier: "CurrentAlertDetailViewController") as! CurrentAlertDetailViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(alertDetailVc, animated: true)
        }
    }
}
extension AlertViewController : UITabBarDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (alertSegmentControl.selectedSegmentIndex == 0)
        {
            return 1
        }
        else
        {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if alertSegmentControl.selectedSegmentIndex == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlertTableViewCell", for: indexPath) as! AlertTableViewCell
            cell.viewDetailsBtn.addTarget(self, action: #selector(viewDetailsBtnTap), for: .touchUpInside)
            cell.layer.cornerRadius = 24
            return cell
        }
        else
        {
            let Detailcell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesTableViewCell", for: indexPath) as! ActivitiesTableViewCell
//            Detailcell.layer.cornerRadius = 24
            return Detailcell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if alertSegmentControl.selectedSegmentIndex == 0
        {
            return 581
        }
        else
        {
            return 140
        }
      }
}
