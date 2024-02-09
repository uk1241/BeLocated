//
//  RescueeViewController.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 08/07/23.
//
import UIKit
import MKToolTip
import AMPopTip
import SwiftUI
class RescueeViewController: UIViewController {
    
    @IBOutlet var rescueTableview: UITableView!
    
    @IBOutlet weak var addRescueeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let poptip = PopTip()
        //custom NavigationBar
        setupCustomNavigationBar()
        // Create a PopTip object
               let popTip = PopTip()

        rescueTableview.register(UINib(nibName: "RescueeTableViewCell", bundle: nil), forCellReuseIdentifier: "RescueeTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addRescueeButtonAction(_ sender: UIButton)
    {
//        PopTip.show(PopTip)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addNewRescueeVc = storyboard.instantiateViewController(withIdentifier: "AddNewRescueeViewController") as! AddNewRescueeViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(addNewRescueeVc, animated: true)
        }
    }
    
}
extension RescueeViewController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RescueeTableViewCell", for: indexPath) as! RescueeTableViewCell
        return cell
    }
   

    
    
}
//extension RescueeViewController:MKToolTipDelegate
//{
//    func toolTipViewDidAppear(for identifier: String) {
//        addRescueeButton.showToolTip(identifier: "", message: "hi", arrowPosition: .top)
//
//    }
//
//    func toolTipViewDidDisappear(for identifier: String, with timeInterval: TimeInterval) {
//
//    }
//
//
//}

