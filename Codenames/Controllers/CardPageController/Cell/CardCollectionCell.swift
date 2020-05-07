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
    
//    enum CardContent {
//        case label(label:String)
//        case image(image:UIImage)
//    }
    enum CardColor {
        case red
        case blue
        case black
        case yellow
    }
    var color: CardColor = .yellow
    var isCardSelected: Bool = false
    let defoultColor: UIColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "white1"))
    //var content: CardContent = .label(label: "defoult")
    
    
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
            return UIColor(hexString: "#f24535")
        case .blue:
            return UIColor(hexString: "#73cec5")
        case .black:
            return UIColor(hexString: "#2d3436")
        case .yellow:
            return UIColor(hexString: "#f4cf65")
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
        cardLabel?.textColor = .black
        cardLabel?.translatesAutoresizingMaskIntoConstraints = false
        cardLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        view.backgroundColor = defoultColor
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        
        
        
        
    }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
//        super.setHighlighted(highlighted, animated: animated)
//        cardImage.alpha = highlighted ? 0.5 : 1
//    }

}
