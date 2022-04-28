//
//  FavoriteTableViewCell.swift
//  ios-groupe5
//
//  Created by Ugo on 28/04/2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var pegi: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
