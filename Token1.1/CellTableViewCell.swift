//
//  CellTableViewCell.swift
//  Token1.1
//
//  Created by Isabel on 5/18/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var distanceLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
