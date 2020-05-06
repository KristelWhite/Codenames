//
//  NewGameViewController.swift
//  Codenames
//
//  Created by Кристина Пастухова on 03.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button: UIButton!
    
    var index : IndexPath?

    
    //let service = DataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 16
        button.titleLabel?.text = "Start Game"
        button.titleLabel?.textColor = .black

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LabelTableCell", bundle: nil),
        forCellReuseIdentifier: "labelCell")
                          
        tableView.register(UINib(nibName: "TitleTableCell", bundle: nil),
                           forCellReuseIdentifier: "titleCell")
        tableView.register(UINib(nibName: "CarouselTableCell", bundle: nil),
                           forCellReuseIdentifier: "carouselCell")
        
    }

    
    @IBAction func tapOnButton(_ sender: Any) {
        self.performSegue(withIdentifier: "startGame", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let cell = self.tableView.cellForRow(at: index!) as! CarouselTableCell
            if let index = cell.collectionView.indexPath(for: cell.lastSelectedCell!) {
            let model = cell.dictionaries[index.row]
            let vc = segue.destination as! CardCollectionViewController
            vc.model = model
            }
        }
    }
}

extension NewGameViewController: UITableViewDataSource,  UITableViewDelegate {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
}

func tableView(_ tableView: UITableView,
               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as! LabelTableCell
        cell.label.text = "Codenames"
        return cell
    } else if indexPath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableCell
        cell.titleLabel.text = "Choose Dictinary"
        return cell
    } else if indexPath.row == 2 {
        index = indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "carouselCell", for: indexPath)
        return cell
    
    }
    return UITableViewCell()
//    } else {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageTableCell else {
//            return UITableViewCell()
//        }
//        let model = photos[indexPath.row - Constants.defaultCount]
//        cell.customImageView.loadImage(by: model.urls.regular)
//        cell.textLabel?.text = model.description
//        return cell
    }
}
