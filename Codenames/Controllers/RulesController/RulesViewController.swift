//
//  RullsViewController.swift
//  Codenames
//
//  Created by Кристина Пастухова on 03.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var text: UILabel!
    @IBAction func tapOnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        back.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        label.text = "Game rules"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .systemYellow
        self.view.backgroundColor = .black
        self.view.alpha = 0.9
//        let backImage = UIImageView(frame: self.view.frame)
//        backImage.image = UIImage(imageLiteralResourceName: "ngb2")
//        self.view.insertSubview(backImage, at: 0)
        back.titleLabel?.textColor = .systemGray2
        text.numberOfLines = 0
        text.textAlignment = .left
        text.text = "Игроки делятся на две команды, равные по силе и количеству. Каждая команда выбирает капитана. Капитаны знают тайные личности 25 агентов. Игроки же знают агентов только по их кодовым именам. Капитаны по очереди дают подсказки, состоящие из одного слова. Слово может относиться к нескольким кодовым именам, выложенным на столе. Игроки пытаются отгадать кодовые имена, которые имеет в виду их капитан. Как только игрок касается карточки с кодовым именем, тайная личность этого кодового имени расскрывается. Если это агент, относящийся к их команде, игроки продолжают отгадывать, пока не ошибутся или не израсходуют свои попытки. Команда, которой первой удалось найти всех своих агентов, выигрывает."
        text.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        text.textColor = .systemGray
    }
    

    
}
