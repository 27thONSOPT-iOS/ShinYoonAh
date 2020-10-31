//
//  PartBannerCell.swift
//  SOPTiOS_thirdSenimar
//
//  Created by SHIN YOON AH on 2020/10/31.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    static let identifier = "PartBannerCell"
    
    @IBOutlet weak var image: UIImageView!
    
    func setImage(named: String) {
        image.image = UIImage(named: named)
    }
}
