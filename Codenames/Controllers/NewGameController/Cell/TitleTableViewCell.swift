//
//  TitleTableViewCell.swift
//  Codenames
//
//  Created by Кристина Пастухова on 19.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
          super.awakeFromNib()
          self.contentView.backgroundColor = .clear
          selectionStyle = .none

          titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
