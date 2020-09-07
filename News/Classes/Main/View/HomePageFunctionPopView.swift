//
//  HomePageFunctionPopView.swift
//  News
//
//  Created by melo on 2020/8/3.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class HomePageFunctionPopView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    var bgView: UIView! //这里必须要加!或者?号，不然会报错
    
    var collectionView: UICollectionView!
    
    lazy var cancelBtn : UIButton = {
        var cancelBtn = UIButton(frame: CGRect.zero)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(colorWithHexString(hexString: "#333333"), for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
        return cancelBtn
    }()
    
    lazy var datas : NSMutableArray = {
        var datas = NSMutableArray(array: [["title": "好友圈", "img": "HomePage_好友圈"],["title": "写文章", "img": "HomePage_写文章"],["title": "发视频", "img": "HomePage_发视频"],["title": "开直播", "img": "HomePage_开直播"],["title": "小视频", "img": "HomePage_小视频"],["title": "发帖子", "img": "HomePage_发帖子"],["title": "提问题", "img": "HomePage_提问题"],["title": "开网店", "img": "HomePage_开网店"]])
        return datas
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        self.initSubviews() 
        
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        self.addGestureRecognizer(tapGesture);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - tapGesture
    @objc func tapGestureAction() {
        self.hide()
    }
    @objc func cancelBtnAction() {
        self.hide()
    }
    
    // MARK: - Private
    func initSubviews() {
        bgView = UIView()
        bgView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: 250)
        bgView.backgroundColor = UIColor.white
        addSubview(bgView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: screenWidth / 4, height: 100)
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(HomePageFunctionCollectionCell.self, forCellWithReuseIdentifier: NSStringFromClass(HomePageFunctionCollectionCell.self))
        bgView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(bgView)
            make.height.equalTo(200)
        }
        
        let line : UIView = UIView()
        line.backgroundColor = colorWithHexString(hexString: "#E0E0E0")
        bgView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom)
            make.left.right.equalTo(bgView)
            make.height.equalTo(0.5)
        }
        
        bgView.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(bgView)
            make.top.equalTo(line.snp.bottom)
        }
    }
    
    func show() {
        //iOS 13之前写法:UIApplication.shared.keyWindow?.addSubview(self)
        UIApplication.shared.windows.last?.addSubview(self)
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame = CGRect(x: 0, y: screenHeight - 250, width: screenWidth, height: 250)
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.bgView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: 250)
            self.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        }) { (completion) in
            self.removeFromSuperview()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomePageFunctionCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HomePageFunctionCollectionCell.self), for: indexPath) as! HomePageFunctionCollectionCell
        
        let dictionary = datas[indexPath.row] as! [String : String]
        cell.icon.image = UIImage(named: dictionary["img"]!)
        cell.titleLab.text = dictionary["title"]
        
        return cell
    }
    
}
