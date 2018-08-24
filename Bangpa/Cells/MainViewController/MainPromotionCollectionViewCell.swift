//
//  MainAdvertisementCell.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class MainPromotionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
