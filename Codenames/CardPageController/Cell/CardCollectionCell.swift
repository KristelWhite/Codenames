//
//  CardCollectionCell.swift
//  Codenames
//
//  Created by Кристина Пастухова on 01.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    enum CardContent {
        case label(label:UILabel)
        case image(image:UIImage)
    }
    enum CardColor {
        case red
        case blue
        case black
        case yellow
    }
    var color: CardColor?
    var content: CardContent?
    
    
//    init(frame: CGRect, color: CardColor, content: CardContent) {
//        self.color = color
//        self.content = content
//        super.init(frame: frame)
//
//    }

//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//    }
    
    func colorOfCurrentCard(info:CardColor) -> UIColor {
        switch info {
        case .red:
            return .red
        case .blue:
            return .blue
        case .black:
            return .black
        case .yellow:
            return .yellow
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentMode = .scaleAspectFill
        layer.cornerRadius = 16
        
        cardLabel?.lineBreakMode = .byWordWrapping
        cardLabel?.numberOfLines = 0
        cardLabel?.adjustsFontSizeToFitWidth = true
        cardLabel?.textAlignment = .center
        cardLabel?.textColor = .white
        cardLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
    }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        super.setHighlighted(highlighted, animated: animated)
//        cardImage.alpha = highlighted ? 0.5 : 1
//    }

}
