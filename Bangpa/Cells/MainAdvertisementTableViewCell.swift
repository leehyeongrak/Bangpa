//
//  MainAdvertisementTableViewCell.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class MainAdvertisementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colletionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        colletionView.delegate = self
        colletionView.dataSource = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension MainAdvertisementTableViewCell: UICollectionViewDelegate {
    
}

extension MainAdvertisementTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainAdvertisementCell.reusableIdentifier, for: indexPath) as? MainAdvertisementCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .red
        return cell
    }
}

extension MainAdvertisementTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: colletionView.frame.width - 20, height: collectionView.frame.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
