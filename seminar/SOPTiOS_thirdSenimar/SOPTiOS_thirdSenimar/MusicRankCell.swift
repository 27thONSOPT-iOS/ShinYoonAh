//
//  MusicRankCell.swift
//  SOPTiOS_thirdSenimar
//
//  Created by SHIN YOON AH on 2020/10/31.
//

import UIKit

class MusicRankCell: UITableViewCell {
    static let identifier = "MusicRankCell"

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(rank: Int, music: Music) {
        albumImageView.image = music.makeAlbumImage()
        rankLabel.text = "\(rank + 1)"
        titleLabel.text = music.title
        singerLabel.text = music.singer
    }
}
