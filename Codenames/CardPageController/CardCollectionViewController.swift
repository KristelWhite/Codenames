//
//  CardCollectionViewController.swift
//  Codenames
//
//  Created by Кристина Пастухова on 01.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit
//import AVFoundation

class CardCollectionViewController: UIViewController, CodenamesLogic {
    

    @IBOutlet weak var gameRight: UIButton!
    
    @IBOutlet weak var doublePointLabel: UILabel!
    @IBOutlet weak var scoreBlueLabel: UILabel!
    @IBOutlet weak var scoreRedLabel: UILabel!
  
    @IBOutlet weak var lineLabel: UILabel!
   
    @IBOutlet weak var keyButton: UIButton!
    
    @IBOutlet weak var detailView: DetailView!
    
    @IBOutlet weak var cardCollection: UICollectionView!
    
    let gameLogic = GameLogic()
    
    let spaceBetweenCell: Double = 5
    let colontitul: Double = 10
    let numberOfCardInLine = 5
    let numberOfCards = 25
    
    let spaceToKeyButton: CGFloat = 44
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollection.delegate = self
        cardCollection.dataSource = self
        cardCollection.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cardCell")
        cardCollection.isUserInteractionEnabled = true
        self.gameLogic.delegate = self
        (cardCollection.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        
        heightScore.constant = normalSizeDetailView
        higthDetailView.constant = normalSizeDetailView
        leadKey.constant = spaceToKeyButton
        trailingKey.constant = spaceToKeyButton * 3
        topKey.constant = 12
        higthKey.constant = normalSizeDetailView - 2 * topKey.constant
        keyButton.backgroundColor = .black
        
        scoreRedLabel.text = String(self.gameLogic.scoreRedCard)
        scoreRedLabel.font = UIFont.systemFont(ofSize: 55, weight: .semibold)
        lineLabel.text = "-"
        lineLabel.font = UIFont.systemFont(ofSize: 170, weight: .ultraLight)
        lineLabel.textColor = .darkGray
        scoreBlueLabel.text = String(self.gameLogic.scoreBlueCard)
        scoreBlueLabel.font = UIFont.systemFont(ofSize: 55, weight: .semibold)
        scoreRedLabel.textColor = .systemRed
        scoreBlueLabel.textColor = .systemBlue
        doublePointLabel.text = ":"
        doublePointLabel.font = UIFont.systemFont(ofSize: 55, weight: .semibold)
        
        gameRight?.heightAnchor.constraint(equalToConstant: 24)
        
        setupGamefBackgroundColor()
        
    }
    func gameDidEnd(messege message: String) {
        print()
        //вызов модального окна
    }
    func setupGamefBackgroundColor() {
        print("фон установлен")
        let color: UIColor
        if self.gameLogic.blueStarsGame {
            color = .systemBlue
            self.view.backgroundColor = color
            self.cardCollection.backgroundColor = color
        } else {
            color = .systemRed
            self.view.backgroundColor = color
            self.cardCollection.backgroundColor = color
        }
        
        
    }
     func changeScore(isBlueCard: Bool, score: Int) {
        if isBlueCard {
            scoreBlueLabel.text = String(score)
        } else {
            scoreRedLabel.text = String(score)
        }
     }
    
    @IBAction func tapDownKey(_ sender: Any) {
        
        for cell in cardCollection.visibleCells {
            let card = cell as? CardCollectionCell
            if !card!.isCardSelected {
                card?.view.backgroundColor = card?.colorOfCurrentCard(info: (card!.color))
            }
            
        }
            
        
    }
    
    
    @IBAction func tapUpKey(_ sender: Any) {
        for cell in cardCollection.visibleCells {
            let card = cell as? CardCollectionCell
            if !card!.isCardSelected {
                card?.view.backgroundColor = card?.defoultColor
            }
            
        }
    }
    
    let normalSizeDetailView: CGFloat = 81
    let largthSizeDetailView: CGFloat = 165
    func exchangOfDetailSize() -> CGFloat {
        return self.largthSizeDetailView - self.normalSizeDetailView
    }
    
 

    @IBOutlet weak var heightScore: NSLayoutConstraint!
    @IBOutlet weak var higthDetailView: NSLayoutConstraint!
    
    
    @IBAction func downSwipeDetailView(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .down
                if (higthDetailView.constant > normalSizeDetailView) {
                    
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {self.detailView.frame.origin.y += self.exchangOfDetailSize()}, completion: {finished in self.higthDetailView.constant = self.normalSizeDetailView })
                    
                }
    }
    @IBAction func upSwipeDetailView(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .up
        if (higthDetailView.constant < largthSizeDetailView) {
            higthDetailView.constant = largthSizeDetailView
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {self.detailView.frame.origin.y -= self.exchangOfDetailSize()}, completion: nil)
        }
        
    }
 
        
    @IBOutlet weak var leadKey: NSLayoutConstraint!
    @IBOutlet weak var higthKey: NSLayoutConstraint!

   
    @IBOutlet weak var trailingKey: NSLayoutConstraint!
    
    @IBOutlet weak var topKey: NSLayoutConstraint!
    
}
    
    


extension CardCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionCell
        cell?.view.backgroundColor = cell?.colorOfCurrentCard(info: cell!.color )
        self.gameLogic.cardDidOpen(cell: cell)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCards
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cardCollection?.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionCell  else {
            return UICollectionViewCell()
        }
        //инкапсулировать
        
        cell.color = self.gameLogic.colorArray[indexPath.row]
         //узнаем что нужно картинки или текст, если текст
        //cell.content = .label(label: self.gameLogic.gameContent[indexPath.row])
        cell.cardLabel.text = self.gameLogic.gameContent[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenCell)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenCell)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: colontitul)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: colontitul)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardWight = (Double(cardCollection.bounds.width) - Double(numberOfCardInLine-1) * spaceBetweenCell) / Double(numberOfCardInLine)
        let cardHeight = (Double(cardCollection.bounds.height) - Double(numberOfCardInLine-1) * spaceBetweenCell - colontitul * 2) / Double(numberOfCardInLine)
        return CGSize(width: cardWight, height: cardHeight)
    }
}
