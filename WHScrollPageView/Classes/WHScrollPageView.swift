//
//  WHScrollPageView.swift
//  WHScrollPageView
//
//  Created by wenhe-liu on 02/23/2017.
//  Copyright (c) 2017 wenhe-liu. All rights reserved.
//

import UIKit

private let kWHScrollPageViewCellID = "kCarouselViewCellID"

public class WHScrollPageView: UIView {
    
    lazy fileprivate var collectionView: UICollectionView = {
        let layout = WHScrollPageViewLayout() 
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .blue
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    lazy fileprivate var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.center = self.center
        pageControl.frame.origin.y = self.frame.height - 6
        
        return pageControl
    }()
    
    fileprivate var setImageBlock : (UIImageView, URL?) -> ()
    
    fileprivate var imageViewClick : (Int) -> ()
    
    ///图片数组 不能为空
    public var imagesURLString: [String]! {
        didSet {
            
            let startIndexPath = IndexPath(item: self.imagesURLString.count * 100, section: 0)
            
//            self.collectionView.reloadItems(at: [startIndexPath])
            self.collectionView.reloadData()
            
            self.pageControl.numberOfPages = self.imagesURLString.count
            
            self.collectionView.scrollToItem(at: startIndexPath, at: .left, animated: false)
            
        }
    }
    
    fileprivate var updateTimer : Timer?
    
    public init(frame: CGRect, _ setImage: @escaping (UIImageView, URL?) -> (), _ imageViewClick: @escaping (Int) -> ()) {
        self.setImageBlock = setImage
        self.imageViewClick = imageViewClick
        super.init(frame: frame)
        collectionView.register(WHScrollPageViewCell.self, forCellWithReuseIdentifier: kWHScrollPageViewCellID)
        
        addTimer()
//        imagesURLString = [String]()
        addSubview(collectionView)
        addSubview(pageControl)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension WHScrollPageView : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("numberOfItemsInSection")
        if self.imagesURLString == nil {
            fatalError("图片数组不能为空, The imagesURLString is nil")
        }
        return imagesURLString.count * 1000
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWHScrollPageViewCellID, for: indexPath) as! WHScrollPageViewCell
        
//        print("cellForItemAt")
            let urlStr = imagesURLString[indexPath.item % imagesURLString.count]
            guard let url = URL(string: urlStr) else {
                setImageBlock(cell.imageView, nil)
                return cell
            }
            setImageBlock(cell.imageView, url)
        
        return cell
    }
}


// MARK:- 定时器操作方法
extension WHScrollPageView {
    fileprivate func addTimer() {
        updateTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(updateTimer!, forMode: .commonModes)
    }
    
    fileprivate func removeTimer() {
        updateTimer?.invalidate()
        updateTimer = nil
    }
    
    @objc private func scrollToNext() {
        let offset = collectionView.contentOffset.x + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
}


class WHScrollPageViewCell : UICollectionViewCell {
     
    fileprivate lazy var imageView : UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = contentView.bounds
        
    }
}

class WHScrollPageViewLayout : UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
//        print("prepare")
        itemSize = collectionView!.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
    }
}

extension WHScrollPageView : UICollectionViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.滚动的距离
        let offsetX = scrollView.contentOffset.x
        // 2.设置pageControl
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % self.imagesURLString.count
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item % imagesURLString.count
        imageViewClick(index)
    }
    
    
}

public extension UIColor {
    
    class func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }
}




