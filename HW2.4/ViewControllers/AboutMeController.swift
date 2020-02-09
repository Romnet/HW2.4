//
//  AboutMeController.swift
//  HW2.4
//
//  Created by Роман on 09.02.2020.
//  Copyright © 2020 Romnet. All rights reserved.
//

import UIKit

class AboutMeController: UIViewController {
    var user: User!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = user.description
    }
}
