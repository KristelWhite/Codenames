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
    
    var model: DictionaryModel?

    @IBOutlet weak var gameRuls: UIButton!
   
    
    @IBOutlet weak var newGame: UIButton!
    
   
    
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
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if model == nil {
            model = DictionaryModel(name: "one", type: true, language: "",  dictContent: ContentModel(word: ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]))
            
        }
        
        
    
        
        cardCollection.delegate = self
        cardCollection.dataSource = self
        cardCollection.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cardCell")
        cardCollection.isUserInteractionEnabled = true
        self.gameLogic.delegate = self
        (cardCollection.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        
        heightScore.constant = normalSizeDetailView
        higthDetailView.constant = normalSizeDetailView
        leadKey.constant = 60
        topKey.constant = 20
        higthKey.constant = 45
        
        
        keyButton.layer.shadowOffset = .zero
        keyButton.layer.shadowColor = UIColor.yellow.cgColor
        keyButton.layer.shadowOpacity = 1
        keyButton.layer.shadowRadius = 0
        keyButton.setTitle("Key", for: .normal)
        keyButton.backgroundColor = .systemGreen
        keyButton.setTitleColor(.black, for: .normal)
        keyButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        keyButton.layer.cornerRadius = 10
        keyButton.layer.borderWidth = 1
        keyButton.layer.borderColor = UIColor.black.cgColor
        
        gameRuls.setTitle("Game rules", for: .normal)
        gameRuls.setTitleColor(.blue, for: .normal)
        gameRuls.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        gameRuls.layer.borderColor =  UIColor.green.cgColor
//        gameRuls.layer.cornerRadius = 10
//        gameRuls.layer.borderWidth = 1
        
        newGame.setTitle("Start new game", for:.normal )
        newGame.setTitleColor(.red, for: .normal)
        newGame.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
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
        
        
        self.cardCollection.backgroundColor = .clear
       
        setupGamefBackgroundColor()
        
        self.gameLogic.shuffleArray()
        
        
        
        
    }
    func gameDidEnd(messege message: String) {
        //вызов модального окна
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameOverVC = storyboard.instantiateViewController(withIdentifier: "GameOverViewController")
        gameOverVC.modalPresentationStyle = .overFullScreen
        present(gameOverVC, animated: true, completion: nil)
        let vc = gameOverVC as? GameOverViewController
        vc?.infoLabel.text = message
        openAllCard()
        
    }
    
    
    
    func openAllCard() -> Void {
        for cell in cardCollection.visibleCells {
            let card = cell as? CardCollectionCell
            if !card!.isCardSelected {
                card!.isCardSelected = true
                card?.view.backgroundColor = card?.colorOfCurrentCard(info: (card!.color))
            }
            
        }
    }
    func setupGamefBackgroundColor() {
        print("фон установлен")
        let backImage = UIImageView(frame: self.view.frame)
        if self.gameLogic.blueStarsGame {
            backImage.image = UIImage(imageLiteralResourceName: "blue")
            self.view.insertSubview(backImage, at: 0)
        } else {
            backImage.image = UIImage(imageLiteralResourceName: "active")
            self.view.insertSubview(backImage, at: 0)
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
        keyButton.layer.shadowRadius = 20
        for cell in cardCollection.visibleCells {
            let card = cell as? CardCollectionCell
            if !card!.isCardSelected {
                card?.view.backgroundColor = card?.colorOfCurrentCard(info: (card!.color))
            }
            
        }
            
        
    }
    
    
    @IBAction func tapUpKey(_ sender: Any) {
        keyButton.layer.shadowRadius = 0
        for cell in cardCollection.visibleCells {
            let card = cell as? CardCollectionCell
            if !card!.isCardSelected {
                card?.view.backgroundColor = card?.defoultColor
            }
            
        }
    }
    
    let normalSizeDetailView: CGFloat = 81
    let largthSizeDetailView: CGFloat = 190
    
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
        
        switch self.model?.type {
        case true:
            cell.cardLabel.text = model?.dictContent?.word?[indexPath.row]
        case false:
            cell.cardImage.image = model?.dictContent?.image?[indexPath.row]
        
        default:
            print("не указан тип")
        }
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
