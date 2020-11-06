//
//  Profile.swift
//  PA3_iOS
//
//  Created by SHIN YOON AH on 2020/11/06.
//

import UIKit

struct Profile {
    var imageName: String
    var statusMessage: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}

