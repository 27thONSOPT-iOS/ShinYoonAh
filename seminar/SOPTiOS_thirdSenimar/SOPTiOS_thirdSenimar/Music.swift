//
//  Music.swift
//  SOPTiOS_thirdSenimar
//
//  Created by SHIN YOON AH on 2020/10/31.
//

import UIKit

struct Music {
    var title: String
    var singer: String
    var albumImageName: String
    
    func makeAlbumImage() -> UIImage? {
        return UIImage(named: albumImageName)
    }
}
