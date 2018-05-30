//
//  ForumTableViewCell.swift
//  Token1.1
//
//  Created by Isabel on 5/29/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit

class ForumTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
