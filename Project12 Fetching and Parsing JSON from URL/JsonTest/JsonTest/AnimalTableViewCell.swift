//
//  AnimalTableViewCell.swift
//  JsonTest
//
//  Created by  Yo on 2017/8/31.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
