//
//  HomePageFunctionCollectionCell.swift
//  News
//
//  Created by 陈诚 on 2020/8/17.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class HomePageFunctionCollectionCell: UICollectionViewCell {
    
    lazy var icon : UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    lazy var titleLab : UILabel = {
        let titleLab = UILabel()
        titleLab.font = UIFont.systemFont(ofSize: 15)
        titleLab.textColor = colorWithHexString(hexString: "#333333")
        titleLab.textAlignment = NSTextAlignment.center
        return titleLab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSubviews();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    func initSubviews() {
        contentView.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(25)
        }
        
        contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(icon.snp.bottom).offset(10)
        }
    }
    
}
