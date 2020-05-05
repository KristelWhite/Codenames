//
//  DictionaryModel.swift
//  Codenames
//
//  Created by Кристина Пастухова on 04.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class DictionaryModel {
    
    struct Dictionary {
        let name: String
        let type: Bool
        let language: String?
        let dictContant: [Content]?
    }
    struct Content {
        let word: [String]?
        let image: [UIImage]?
    }
}
