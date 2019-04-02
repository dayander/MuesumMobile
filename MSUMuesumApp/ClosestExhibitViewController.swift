//
//  ClosestExhibitViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/25/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//
import UIKit
class ClosestExhibitViewController: UIViewController{
    
    @IBOutlet weak var tagName: UILabel!
    @IBAction func reloadExhibits(_ sender: Any) {
        
        tagName.text = appDelegate.tag
        
        
        
        
    }
    
    var tag: String!
    var closeExhibits: [Exhibit]!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    //weak var appDel: AppDelegate!
    
    
    
    var text: String!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(appDelegate.tag!)
        
        tagName.text = appDelegate.tag!
        
        
        
    }
    

    @IBAction func unwindToPrevVC( segue: UIStoryboardSegue) {
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}






//extension ClosestExhibitViewController: ObserverDelegate {
//    func updateRoomBasedOnTag(tag: String) {
//        print(tag)
//        return
//    }
//
//
//}






