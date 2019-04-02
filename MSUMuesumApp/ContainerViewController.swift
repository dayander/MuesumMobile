//
//  ContainerViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 4/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
      var delegate: ObserverDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifer = segue.identifier {
            if identifer == "ToClosestExhibit"{
                if let closestExhibitVC = segue.destination as? ClosestExhibitViewController{
                    
                }
            }
        }
    }

}


protocol ObserverDelegate {
    func updateRoomBasedOnTag(tag:String)
    
    
}
