//
//  CarouselTableViewCell.swift
//  Codenames
//
//  Created by Кристина Пастухова on 08.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//





import UIKit

class CarouselTableViewCell: UITableViewCell {
    
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var dictionaries = [DictionaryModel]()
    let service = DataProvider()
   


    var choosedDictionary : DictionaryModel?
    var lastSelectedCell: CollectionDictCell?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.backgroundColor = .clear
        
        selectionStyle = .none
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionDictCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        
        //загрузить словари
        loadData()
    }
    func loadData() {
        service.loadDictionaryFromCoreData(onComplite: { [weak self] (dictionaries) in
            self?.dictionaries = dictionaries
            print("dictionaries count", dictionaries.count)
            self?.collectionView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

    
}

extension CarouselTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionaries.count
    }
    func setShadow(cell: CollectionDictCell) -> Void {
//        cell.layer.shadowRadius = 20
//        cell.layer.shadowOpacity = 0.6
//        cell.layer.shadowOffset = CGSize.zero
        cell.layer.borderColor = UIColor(hexString: "#4CAF50").cgColor
        cell.layer.borderWidth = 5
        cell.label.textColor = UIColor(hexString: "#4CAF50")
    }
    func deleteShadow(cell: CollectionDictCell)  {
//        cell.layer.shadowOffset = .zero
        cell.layer.borderWidth = 0
        cell.label.textColor = .white
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionDictCell else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0,  choosedDictionary == nil {
            //
            setShadow(cell: cell)
        }
        let model = dictionaries[indexPath.row]
        cell.label.text = model.name
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = (collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as? CollectionDictCell) {
           deleteShadow(cell: cell)
        }
        if let lastCell = lastSelectedCell {
            deleteShadow(cell: lastCell)
            lastCell.isSelected = false
        }
        
        print(lastSelectedCell?.isSelected ??  "не установленно")
        lastSelectedCell = collectionView.cellForItem(at: indexPath) as? CollectionDictCell
        choosedDictionary = dictionaries[indexPath.row]
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        setShadow(cell: lastSelectedCell!)
    }
    

}
