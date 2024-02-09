//  PriortizeSupportCastViewController.swift
//  BelocatedTabBar
//  Created by R Unnikrishnan on 03/08/23.

import UIKit
import SwiftReorder

class PriortizeSupportCastViewController: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var priortizeTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.makeRounded()
        priortizeTableview.register(UINib(nibName: "priortizeSupportCastTableViewCell", bundle: nil), forCellReuseIdentifier: "priortizeSupportCastTableViewCell")
        priortizeTableview.reorder.delegate = self
    }
}
extension PriortizeSupportCastViewController : UITableViewDelegate,UITableViewDataSource,TableViewReorderDelegate
{
    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priortizeSupportCastTableViewCell", for: indexPath) as! priortizeSupportCastTableViewCell
        if let spacer = tableView.reorder.spacerCell(for: indexPath) {
                return spacer
            }
        return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    
}
