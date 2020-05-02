//
//  DetailView.swift
//  Codenames
//
//  Created by Кристина Пастухова on 02.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class DetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup() -> Void {
        self.isOpaque = false
        self.alpha = 0.7
        self.backgroundColor = .lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 30.0)

    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
    }
    
    

}
