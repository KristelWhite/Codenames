//
//  CollectionDictCell.swift
//  Codenames
//
//  Created by Кристина Пастухова on 05.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class CollectionDictCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = .center
        
    }

}
