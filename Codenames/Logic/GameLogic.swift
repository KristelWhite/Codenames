//
//  File.swift
//  Codenames
//
//  Created by Кристина Пастухова on 02.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

protocol CodenamesLogic: class {
    func gameDidEnd()
}

class GameLogic {
    weak var delegate: CodenamesLogic?
    
   func cardDidOpen(cell : CardCollectionCell?) -> Void {
           self.delegate?.gameDidEnd()
      }
    
}
