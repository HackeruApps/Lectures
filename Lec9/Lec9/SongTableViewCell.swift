//
//  SongTableViewCell.swift
//  Lec9
//
//  Created by hackeru on 14/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    
    @IBOutlet weak var artistImage: UIImageView!
    
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var songArtist: UILabel!    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
