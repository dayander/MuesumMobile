//
//  HomeViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/22/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import MaterialComponents


class HomeViewController: MDCAppBarContainerViewController{
    
    let card = MDCCard()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MSU Museum"
        
        card.backgroundColor = .black
        
        self.view.addSubview(card)

        




    }
    
    
    
}
