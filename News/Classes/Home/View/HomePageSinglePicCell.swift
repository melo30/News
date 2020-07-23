//
//  HomePageMultiplePicCell.swift
//  News
//
//  Created by melo on 2020/7/23.
//  Copyright © 2020 陈诚. All rights reserved.
//  单图cell

import UIKit

class HomePageSinglePicCell: UITableViewCell {

    var titleLab : UILabel?
    var imgV : UIImageView?
    var authorLab : UILabel?
    var commentLab : UILabel?
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
        titleLab?.textColor = RGBColor(r: 51, g: 51, b: 51)
        titleLab?.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(titleLab!)
        titleLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.top.equalTo(contentView).offset(10)
        })
        
        imgV = UIImageView()
        contentView.addSubview(imgV!)
        imgV?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.top.equalTo(titleLab!.snp.bottom).offset(10)
            make.height.equalTo(200)
        })
        
        authorLab = UILabel()
        authorLab?.textColor = colorWithHexString(hexString: "#999999")
        authorLab?.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(authorLab!)
        authorLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(titleLab!)
            make.top.equalTo(imgV!.snp.bottom).offset(10)
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
