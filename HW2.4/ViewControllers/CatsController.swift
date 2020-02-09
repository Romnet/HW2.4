//
//  CatsController.swift
//  HW2.4
//
//  Created by Роман on 09.02.2020.
//  Copyright © 2020 Romnet. All rights reserved.
//

import UIKit

class CatsController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    private let imageNames = ["Image1", "Image2", "Image3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentImageIndex = 0
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            self.imageView.image = UIImage(named: self.imageNames[currentImageIndex])
            currentImageIndex += 1
            if currentImageIndex == self.imageNames.count { currentImageIndex = 0 }
        }
        timer.fire()
        
    }
}
