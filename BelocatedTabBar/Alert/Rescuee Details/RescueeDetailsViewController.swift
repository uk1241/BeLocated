//
//  RescueeDetailsViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 11/07/23.
//

import UIKit
import UPCarouselFlowLayout

class RescueeDetailsViewController: UIViewController {

    @IBOutlet var rescueCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rescueCollectionView.register(UINib(nibName: "RescueeDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RescueeDetailsCollectionViewCell")
        
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSizeMake(100,100)
        layout.scrollDirection = .horizontal
        rescueCollectionView.collectionViewLayout = layout
      
    }
}
extension RescueeDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RescueeDetailsCollectionViewCell", for: indexPath) as! RescueeDetailsCollectionViewCell
        return cell
    }
    
    
}
