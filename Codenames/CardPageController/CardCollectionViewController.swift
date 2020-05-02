//
//  CardCollectionViewController.swift
//  Codenames
//
//  Created by Кристина Пастухова on 01.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class CardCollectionViewController: UIViewController, CodenamesLogic {

    @IBOutlet weak var deteilView: UIView!
    @IBOutlet weak var cardCollection: UICollectionView!
    
    let gameLogic = GameLogic()
    
    let spaceBetweenCell: Double = 5
    let colontitul: Double = 10
    let numberOfCardinLine = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deteilView.backgroundColor = .systemPink
        cardCollection.delegate = self
        cardCollection.dataSource = self
        cardCollection.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cardCell")
        cardCollection.isUserInteractionEnabled = true
        self.gameLogic.delegate = self
        
    }
    func gameDidEnd() {
        print()
    }

    


}

extension CardCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionCell
        self.gameLogic.cardDidOpen(cell: cell)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cardCollection.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionCell else {
            return UICollectionViewCell()
        }
        //dataSourse
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
        let cardWight = (Double(cardCollection.bounds.width) - Double(numberOfCardinLine-1) * spaceBetweenCell) / Double(numberOfCardinLine)
        let cardHeight = (Double(cardCollection.bounds.height) - Double(numberOfCardinLine-1) * spaceBetweenCell - colontitul * 2) / Double(numberOfCardinLine)
        return CGSize(width: cardWight, height: cardHeight)
    }
}
