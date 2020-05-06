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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backToGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
