//
//  MyOtherCell.swift
//  News
//
//  Created by melo on 2020/7/16.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell {

    
    @IBOutlet weak var leftLab: UILabel!
    
    @IBOutlet weak var rightLab: UILabel!
    @IBOutlet weak var rightImgV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
