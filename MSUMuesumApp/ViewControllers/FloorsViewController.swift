//
//  FloorsViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/3/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit

class FloorsViewController: UIViewController {
    var floors = [String:[Exhibit]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.floors)
        // Do any additional setup after loading the view.
        self.setupUI(floors: self.floors)
    }
    
    func setupUI(floors: [String:[Exhibit]]) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SpecificExhibits" {
            if let destination = segue.destination as? SpecificExhibitsViewController{
                destination.exhibits = self.floors["Habitat Hall"]!
                destination.room = "Habitat Hall"
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
