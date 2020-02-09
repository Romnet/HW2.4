//
//  ProfileController.swift
//  HW2.4
//
//  Created by Роман on 09.02.2020.
//  Copyright © 2020 Romnet. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet var helloLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = "Hello, " + user.username
    }
    
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}
