//
//  RullsViewController.swift
//  Codenames
//
//  Created by Кристина Пастухова on 03.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit

class RullsViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    
    @IBAction func tapOnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
