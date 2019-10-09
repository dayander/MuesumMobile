//
//  GalleriesViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/25/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import MaterialComponents

class GalleriesViewController: MDCAppBarContainerViewController {

  var navTitle = UILabel()
        
    
        override func viewDidLoad() {
            super.viewDidLoad()
            //self.navigationItem.title = "Galleries"
            //navTitle.textAlignment = .left
            navTitle.text = "Galleries"
            self.navigationItem.title = "Galleries"


        // Do any additional setup after loading the view.
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
