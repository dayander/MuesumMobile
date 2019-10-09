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
    var rooms = [Room]()
    var roomMap = [String: [Exhibit]]()
    var networkManager = NetworkManager()
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("loading")
        let child = SpinnerViewController()
//addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        DispatchQueue.main.async {
            self.networkManager.getRooms() { rooms, error in
                if error != nil {
                    print(error!)
                }
                
                if rooms != nil {
                    self.rooms = rooms!
                    for room in rooms! {
                        self.roomMap[room.name] = room.exhibits
                    }
                    
                    print("loading complete")
                    DispatchQueue.main.async {
                        child.willMove(toParent: nil)
                        child.view.removeFromSuperview()
                        child.removeFromParent()
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("rooms", self.rooms)
        if segue.identifier == "ToClosestExhibits"{
            print("closestExhibitSeuge")
            if let destination = segue.destination as? ClosestExhibitViewController{
                destination.rooms = self.rooms
                destination.roomMap = self.roomMap
            }
        }
        
        if segue.identifier == "ContainerToHome" {
            print("ContainerToHome")
            
        }
    }
}

protocol RoomsDelegate {
    func sendRoomDataToVC(rooms: [Room])
}

protocol ObserverDelegate {
    func updateRoomBasedOnTag(tag:String)
}
