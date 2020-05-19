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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.contentMode = .center
        //self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "active"))
        let backImage = UIImageView(frame: self.view.frame)
        backImage.image = UIImage(imageLiteralResourceName: "ngb2")
        self.view.insertSubview(backImage, at: 0)
        self.tableView.backgroundColor = .clear
        
        button.layer.cornerRadius = 16
        button.setTitleColor(.white, for: .normal)
        //button.setBackgroundImage(UIImage(imageLiteralResourceName: "green"), for: .normal)
//        let buttonImage = UIImageView(frame: self.view.frame)
//        buttonImage.image = UIImage(imageLiteralResourceName: "green")
//        self.view.insertSubview(buttonImage, at: 0)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor(hexString: "#4CAF50")
        
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.6
        button.layer.shadowOffset = CGSize(width: 4, height: 4)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LabelTableCell", bundle: nil),
        forCellReuseIdentifier: "labelCell")
                          
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "titleCell")
        tableView.register(UINib(nibName: "CarouselTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "carouselCell")
        
    }

    
    @IBAction func tapOnButton(_ sender: Any) {
        self.performSegue(withIdentifier: "startGame", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let cell = self.tableView.cellForRow(at: index!) as! CarouselTableViewCell
            
            if let dict = cell.choosedDictionary  {
            let model = dict
            let vc = segue.destination as! CardCollectionViewController
            vc.model = model
            } else {
                let model = cell.dictionaries[0]
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
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    } else if indexPath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell

        print(cell)
        cell.titleLabel.text = "Choose Dictionary"
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    } else if indexPath.row == 2 {
        index = indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "carouselCell", for: indexPath) as! CarouselTableViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell

    }
    else {
    return UITableViewCell()
    }
}
}
