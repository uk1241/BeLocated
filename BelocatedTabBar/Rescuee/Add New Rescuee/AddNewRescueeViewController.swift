//
//  AddNewRescueeViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 06/10/23.
//

import UIKit

class AddNewRescueeViewController: UIViewController {
    @IBOutlet var addNewRescueeTableView: UITableView!
    @IBOutlet var continueBtn : UIButton!
    let stringArray: [String] = ["Human", "Pet", "Myself", "Property"]
    let imageArray: [UIImage?] = [UIImage(named: "Human"),UIImage(named: "Pet"),UIImage(named: "Property"),UIImage(named: "Myself")]

    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.makeRounded()
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        addNewRescueeTableView.backgroundColor = .clear
        addNewRescueeTableView.register(UINib(nibName: "AddNewRescueeTableViewCell", bundle: nil), forCellReuseIdentifier: "AddNewRescueeTableViewCell")
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SupportCastMainViewController") as! SupportCastMainViewController
                    navigationController?.pushViewController(secondViewController, animated: true)

    }
    
}

extension AddNewRescueeViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewRescueeTableViewCell", for: indexPath) as! AddNewRescueeTableViewCell
        cell.rescueeTypeLabel.text = stringArray[indexPath.row]
        cell.rescueTypeIMage.image = imageArray[indexPath.row]
        cell.contentView.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection
        if let cell = tableView.cellForRow(at: indexPath) as? AddNewRescueeTableViewCell {
            cell.bgview.layer.borderColor = UIColor.systemYellow.cgColor
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AddNewRescueeTableViewCell {
            cell.bgview.layer.borderColor = UIColor(hexString: "#EBEAEA")?.cgColor
        }
    }
    
}
