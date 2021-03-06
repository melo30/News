//
//  HomeSingleTextCell.swift
//  News
//
//  Created by 陈诚 on 2020/7/19.
//  Copyright © 2020 陈诚. All rights reserved.
//  纯文字cell

import UIKit
import SnapKit

class HomeSingleTextCell: UITableViewCell {
    
    var titleLab : UILabel?
    var authorLab : UILabel?
    var commentLab : UILabel?
    var timeLab : UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        initSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        titleLab = UILabel()
        titleLab?.numberOfLines = 3
        titleLab?.textColor = RGBColor(r: 51, g: 51, b: 51)
        titleLab?.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(titleLab!)
        titleLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.top.equalTo(contentView).offset(10)
        })
        
        authorLab = UILabel()
        authorLab?.textColor = colorWithHexString(hexString: "#999999")
        authorLab?.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(authorLab!)
        authorLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(titleLab!)
            make.top.equalTo(titleLab!.snp.bottom).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        })
        
        commentLab = UILabel()
        commentLab?.textColor = colorWithHexString(hexString: "#999999")
        commentLab?.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(commentLab!)
        commentLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(authorLab!.snp.right).offset(10)
            make.centerY.equalTo(authorLab!)
        })
        
        timeLab = UILabel()
        timeLab?.textColor = colorWithHexString(hexString: "#999999")
        timeLab?.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(timeLab!)
        timeLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(commentLab!.snp.right).offset(10)
            make.centerY.equalTo(authorLab!)

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
