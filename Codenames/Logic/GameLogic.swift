//
//  File.swift
//  Codenames
//
//  Created by Кристина Пастухова on 02.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

protocol CodenamesLogic: class {
    func gameDidEnd(messege: String)
    func changeScore(isBlueCard: Bool, score: Int )
    var model: DictionaryModel? {get set}
}

class GameLogic {
    weak var delegate: CodenamesLogic?
    var scoreRedCard: Int = 8
    var scoreBlueCard: Int = 8
    
//    enum Content {
//        case labels(arrayLabels: Array<String>)
//        case images(arrayImages: Array<UIImage>)
//    }
//    var gameContent: Content
    
    //сделать let и присваивать функции, а в этой функции определять кто первый ходит и конечный вариант массива
    var colorArray: Array<CardCollectionCell.CardColor> = [.black, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .blue, .blue, .blue, .blue, .blue, .blue, .blue, .blue, .red, .red, .red, .red, .red, .red, .red, .red]
    
    let blueStarsGame = Bool.random()
    
   func cardDidOpen(cell : CardCollectionCell?) -> Void {
    
    if cell!.isCardSelected  {
        print("just select")
        return
    }
    cell!.isCardSelected = true
    switch cell!.color {
    case .red:
        scoreRedCard -= 1
        self.delegate?.changeScore(isBlueCard: false, score: scoreRedCard)
        if scoreRedCard == 0 {
            self.delegate?.gameDidEnd(messege: "Red team wins !")
        }
    case .blue:
        scoreBlueCard -= 1
        self.delegate?.changeScore(isBlueCard: true, score: scoreBlueCard)
        if scoreBlueCard == 0 {
            self.delegate?.gameDidEnd(messege: "Blue team wins !")
        }
    case .black:
        self.delegate?.gameDidEnd(messege: "Black card !")
    case .yellow:
        print("yellow card")
     }
    
 }
    init() {
        
        self.setupStartColor()
        colorArray.shuffle()
        
    }
    
    func setupStartColor() -> Void {
        if blueStarsGame {
            colorArray += [.blue]
            scoreBlueCard += 1
        } else {
            colorArray += [.red]
            scoreRedCard += 1
            
        }
    }
    
    func shuffleArray() -> Void {
        print("yes")
        if self.delegate?.model?.type == true  {
            self.delegate?.model?.dictContent?.word!.shuffle()
        } else {
            self.delegate?.model?.dictContent?.image!.shuffle()
        }
    }
}
 
