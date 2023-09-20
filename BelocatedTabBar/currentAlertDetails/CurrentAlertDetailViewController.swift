//
//  CurrentAlertDetailViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 08/09/23.
//

import UIKit

class CurrentAlertDetailViewController: UIViewController {
    @IBOutlet var currentAlertDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAlertDetailTableView.register(UINib(nibName: "rescueCompleteTableViewCell", bundle: nil), forCellReuseIdentifier: "rescueCompleteTableViewCell")
        currentAlertDetailTableView.register(UINib(nibName: "supportTableViewCell", bundle: nil), forCellReuseIdentifier: "supportTableViewCell")
        currentAlertDetailTableView.register(UINib(nibName: "currentResucerTableViewCell", bundle: nil), forCellReuseIdentifier: "currentResucerTableViewCell")
        currentAlertDetailTableView.register(UINib(nibName: "rescueHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "rescueHistoryTableViewCell")
    }
}
extension CurrentAlertDetailViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 1
        }
        else if section == 1
        {
            return 5
        }
        else if section == 2
        {
            return 1
        }
        else
        {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let completedAlertCell  = tableView.dequeueReusableCell(withIdentifier: "rescueCompleteTableViewCell", for: indexPath) as! rescueCompleteTableViewCell
            return completedAlertCell
        }
        else if indexPath.section == 1
        {
            let supportCastCell  = tableView.dequeueReusableCell(withIdentifier: "supportTableViewCell", for: indexPath) as! supportTableViewCell
            return supportCastCell
        }
        else if indexPath.section == 2
        {
            let currentRescueCell = tableView.dequeueReusableCell(withIdentifier: "currentResucerTableViewCell", for: indexPath) as! currentResucerTableViewCell
            return currentRescueCell
        }
        else
        {
            let rescueHistoryCell = tableView.dequeueReusableCell(withIdentifier: "rescueHistoryTableViewCell", for: indexPath) as! rescueHistoryTableViewCell
            return rescueHistoryCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 400
        }
        else if indexPath.section == 1
        {
            return 111
        }
        else if indexPath.section == 2
        {
            return 100
        }
        else
        {
            return 100
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Support Cast"
        case 2:
            return "Current Rescuer"
        case 3:
            return "Rescuer History"
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        if section > 0
        {
            headerView.backgroundColor = UIColor.init(hexString: "#EBEAEA")
            let titleLabel = UILabel()
            titleLabel.text = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: section)
            titleLabel.frame = CGRect(x: 20, y: 5, width: 200, height: 16)
            titleLabel.textColor = UIColor.init(hexString: "#636569")
            titleLabel.font = .boldSystemFont(ofSize: 16)
            headerView.addSubview(titleLabel)
            let hideDetailsButton = UIButton(type: .system)
            hideDetailsButton.setTitle("Hide Details", for: .normal)
            hideDetailsButton.frame = CGRect(x: 280, y: 5, width: 84, height: 18)
            hideDetailsButton.addTarget(self, action: #selector(hideDetailsButtonTapped(_:)), for: .touchUpInside)
            hideDetailsButton.setTitleColor(UIColor.init(hexString: "#463A08"), for: .normal)
            headerView.addSubview(hideDetailsButton)
        }
        return headerView
    }
    // MARK: - Button Action
    @objc func hideDetailsButtonTapped(_ sender: UIButton)
    {
        
        
    }
}
