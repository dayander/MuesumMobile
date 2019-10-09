//
//  MuseumNavController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/25/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import MaterialComponents


class MuseumNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = MainColors().SpartanGreen
        self.navigationBar.tintColor = .white
    }
}
