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
    
    lazy var datas : NSMutableArray = {
        var datas = NSMutableArray()
//        datas.
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
    
    // MARK: - Private
    func initSubviews() {
        bgView = UIView()
        bgView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: 200)
        bgView.backgroundColor = UIColor.white
        addSubview(bgView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        addSubview(collectionView)
        
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomePageFunctionCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HomePageFunctionCollectionCell.self), for: indexPath) as! HomePageFunctionCollectionCell
        return cell
    }
    
    func show() {
        //iOS 13之前写法:UIApplication.shared.keyWindow?.addSubview(self)
        UIApplication.shared.windows.last?.addSubview(self)
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame = CGRect(x: 0, y: screenHeight - 200, width: screenWidth, height: 200)
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.bgView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: 200)
            self.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        }) { (completion) in
            self.removeFromSuperview()
        }
    }
}
