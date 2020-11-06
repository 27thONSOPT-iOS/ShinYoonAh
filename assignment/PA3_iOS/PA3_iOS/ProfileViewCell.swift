//
//  ProfileViewCell.swift
//  PA3_iOS
//
//  Created by SHIN YOON AH on 2020/11/06.
//

import UIKit

class ProfileViewCell: UICollectionViewCell {
    static let identifier = "ProfileViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileName: UILabel!
    
    func setCell(info: Profile) {
        profileImage.image = UIImage(named: info.imageName)
        profileName.text = info.imageName
        profileLabel.text = info.statusMessage
    }
}
