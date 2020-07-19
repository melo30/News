//
//  HomeSingleTextCell.swift
//  News
//
//  Created by 陈诚 on 2020/7/19.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit
import SnapKit

class HomeSingleTextCell: UITableViewCell {
    
    var titleLab : UILabel?
    var authorLab : UILabel?
    var timeLab : UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        titleLab = UILabel()
        titleLab?.numberOfLines = 3
        titleLab?.backgroundColor = RGBColor(r: 51, g: 51, b: 51)
        titleLab?.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(titleLab!)
        titleLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
