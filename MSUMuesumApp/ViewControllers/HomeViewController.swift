//
//  HomeViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/22/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import MaterialComponents

protocol DataDelegateProtocol {
    func sendDataToVC(data: Any)
}

class HomeViewController: UIViewController {
    let card = MDCCard()
    var rooms = [Room]()
    var roomMap = [String:[Exhibit]]()
    var floorsMaps = [String:[Exhibit]]()
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
        self.navigationItem.title = "MSU Museum"
        card.backgroundColor = .black
        networkManager.getRooms() { rooms, error in
            if rooms != nil {
                self.rooms = rooms!
                print(self.rooms)
                for room in rooms! {
                    self.roomMap[room.name] = room.exhibits
                    self.floorsMaps[room.name] = room.exhibits
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToClosestExhibits"{
            print("closestExhibitSeuge")
            if let destination = segue.destination as? ClosestExhibitViewController{
                destination.rooms = self.rooms
                destination.roomMap = self.roomMap
            }
        }
        
        if segue.identifier == "floors" {
            if let destination = segue.destination as? FloorsViewController {
                destination.floors = self.roomMap
            }
        }
        
        if segue.identifier == "rooms" {
            if let destination = segue.destination as? RoomsViewController {
                destination.rooms = self.rooms
                destination.roomMap = self.roomMap
            }
        }
    }
}
