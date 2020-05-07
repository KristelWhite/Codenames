//
//  GameOverViewController.swift
//  Codenames
//
//  Created by Кристина Пастухова on 03.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var back: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame.layer.cornerRadius = 20
        newGame.layer.borderColor = UIColor.systemGreen.cgColor
        newGame.layer.borderWidth = 1
        newGame.setTitleColor(.systemGreen, for: .normal)
        newGame.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        back.layer.cornerRadius = 20
        back.layer.borderColor = UIColor.systemGray.cgColor
        back.layer.borderWidth = 1
        back.setTitleColor(.systemGray2, for: .normal)
        back.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
    }
    

    @IBAction func backToGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
