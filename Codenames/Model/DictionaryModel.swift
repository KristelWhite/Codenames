//
//  DictionaryModel.swift
//  Codenames
//
//  Created by Кристина Пастухова on 04.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit
    
    struct DictionaryModel {
        var name: String
        var type: Bool
        var language: String?
        var dictContent: ContentModel?
    }

    struct ContentModel {
        var word: [String]?
        var image: [UIImage]?
    }

