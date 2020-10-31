//
//  MusicInfoViewController.swift
//  SOPTiOS_thirdSenimar
//
//  Created by SHIN YOON AH on 2020/10/31.
//

import UIKit

class MusicInfoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        if let music = self.music {
            titleLabel.text = music.title
            singerLabel.text = music.singer
            albumImageView.image = music.makeAlbumImage()
        }
        
        titleLabel.sizeToFit()
        singerLabel.sizeToFit()
    }
}
