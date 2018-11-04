//
//  MovieCell.swift
//  Lec6TableViews
//
//  Created by hackeru on 04/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
