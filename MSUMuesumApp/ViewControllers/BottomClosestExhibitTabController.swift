//
//  BottomClosestExhibitTabController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/25/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit

class BottomClosestExhibitTabController: UITabBarController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //self.delegate = self
        
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    
    
}
