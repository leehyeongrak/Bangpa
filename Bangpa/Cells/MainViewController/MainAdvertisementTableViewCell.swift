//
//  MainAdvertisementTableViewCell.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class MainAdvertisementTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    let cellCount = 4
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func indexOfMajorCell() -> Int {
        let itemWidth = collectionViewLayout.itemSize.width
        let proportionalOffset = collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        var index = Int(round(proportionalOffset))
        
        if CGFloat(index) - proportionalOffset < -0.2 {
            index += 1
        }else if CGFloat(index) - proportionalOffset > 0.2 {
            index -= 1
        }
        
        let safeIndex = max(0, min(cellCount - 1, index))
        return safeIndex
    }
}

extension MainAdvertisementTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainAdvertisementCell.reusableIdentifier, for: indexPath) as! MainAdvertisementCell
        return cell
    }
    
    // scrollview delegates
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        let indexOfMajorCell = self.indexOfMajorCell()
        let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
        collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension MainAdvertisementTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewLayout.collectionView!.frame.size.width - 20 * 2, height: collectionView.frame.size.height)
    }
}
