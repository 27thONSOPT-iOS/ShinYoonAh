//
//  CollectionTestOneVC.swift
//  PA3_iOS
//
//  Created by SHIN YOON AH on 2020/11/12.
//

import UIKit

class CollectionTestOneVC: UIViewController {
    @IBOutlet weak var blueCollectionView: UICollectionView!
    @IBOutlet weak var grayCollectionView: UICollectionView!
    @IBOutlet weak var purpleCollectionView: UICollectionView!
    
    var items: [String] = ["1", "1", "1", "1", "1", "1", "1", "1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueCollectionView.delegate = self
        blueCollectionView.dataSource = self
        grayCollectionView.delegate = self
        grayCollectionView.dataSource = self
        purpleCollectionView.delegate = self
        purpleCollectionView.dataSource = self
    }
}

extension CollectionTestOneVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == blueCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexPath)
            
            return cell
        } else if collectionView == grayCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
            
            return cell
        }
    }
}

extension CollectionTestOneVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == blueCollectionView {
            let cellWidth: CGFloat = collectionView.frame.width - 16 - 60
            let cellHeight: CGFloat = collectionView.frame.height - 21 - 38
            
            return CGSize(width: cellWidth, height: cellHeight)
        } else if collectionView == grayCollectionView {
            let cellWidth: CGFloat = (collectionView.frame.width - 16 - 71) / 3
            let cellHeight: CGFloat = collectionView.frame.height - 10 - 25
            
            return CGSize(width: cellWidth, height: cellHeight)
        } else {
            let cellWidth: CGFloat = (collectionView.frame.width - 16 - 33 - 8) / 2
            let cellHeight: CGFloat = collectionView.frame.height - 21 - 38
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == blueCollectionView {
            return UIEdgeInsets(top: 21.0, left: 16.0, bottom: 38, right: 16.0)
        } else if collectionView == grayCollectionView {
            return UIEdgeInsets(top: 10.0, left: 16.0, bottom: 25.0, right: 16.0)
        } else {
            return UIEdgeInsets(top: 21.0, left: 16.0, bottom: 38.0, right: 16.0)
        }
    }
}


