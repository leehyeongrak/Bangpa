//
//  SectionDescriptionTableViewCell.swift
//  Bangpa
//
//  Created by 이동건 on 19/08/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class SectionDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        descriptionLabel.text = nil
        showAllButton.isHidden = true
    }
}
