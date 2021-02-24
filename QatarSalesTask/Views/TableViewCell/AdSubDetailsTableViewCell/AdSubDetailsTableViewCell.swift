//
//  AdSubDetailsTableViewCell.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class AdSubDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var headingTitleLabel:UILabel!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var backView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
