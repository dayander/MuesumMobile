//
//  HomeViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/22/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import MaterialComponents
import SwiftyJSON


class HomeViewController: MDCAppBarContainerViewController{
    
    let card = MDCCard()
    var   rooms = [Room]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MSU Museum"
        
        card.backgroundColor = .black
        
        self.view.addSubview(card)

        
        //getData()



    }
    
    
//    func getData(){
//
//        var rooms = [Room]()
//
//        let url = URL(string:"http://msu-museum-server.herokuapp.com/getrooms")!
//        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
//
//            if let data = data{
//                let json = JSON(data)
//
//                //loops through only the rooms //for each room
//                for (key,subJson):(String, JSON) in json {
//
//
//                    var roomName = ""
//                    var roomId = ""
//
//                    var beacon = Beacon(id: "", identifier: "", roomName: "")
//
//                    var exhibits = [Exhibit]()
//
//                    //exposes device, exhibits array, Gives you room name and room id
//                    for (i, sj) in subJson{
//
//
//                        if(i == "name"){
//                            roomName = sj.stringValue
//
//                        }
//                        if(i == "_id"){
//                            roomId = sj.stringValue
//
//                        }
//
//                        if(i == "device"){
//
//                            beacon.id = sj["id"].stringValue
//                            beacon.identifier = sj["identifier"].stringValue
//                            beacon.roomName = sj["payload"]["roomName"].stringValue
//
//                        }
//
//
//                        if(i == "exhibits"){
//                            for(k, v) in sj{
//                                //v is an exhibit obj
//                                let name = v["name"].stringValue
//                                let subHead = v["subHead"].stringValue
//                                let mainImg = Image(altText:v["mainImg"]["altText"].stringValue, path: v["mainImg"]["path"].stringValue )
//                                var appSections = [AppSection]()
//
//                                if(v["appSections"].arrayValue.count != 0){
//
//                                    let test = v["appSections"].arrayValue
//
//                                    for (obj):(JSON) in test {
//
//                                        appSections.append(AppSection(id: obj["_id"].stringValue, sectionHeading: obj["sectionHeading"].stringValue, sectionImagePath: obj["sectionImagePath"].stringValue, sectionImageAltText: obj["sectionImageAltText"].stringValue, sectionDescription: obj["sectionDescription"].stringValue, order: Int(truncating: obj["order"].numberValue)))
//
//                                    }
//
//
//
//                                }
//
//                                var exhibit = Exhibit(name: name, subHead: subHead, mainImg: mainImg, appSections: appSections)
//
//                                exhibits.append(exhibit)
//                            }
//                        }
//
//
//
//                    }
//
//
//
//                    rooms.append(Room(name: roomName, id: roomId, device: beacon, exhibits: exhibits))
//
//
//
//
//
//
//                }
//
//
//                self.museumRooms = rooms
//
//                print("self", self.museumRooms)
//
//            }
//
//
//            if let error = error{
//                print("error", error)
//            }
//
//        }
//
//
//        task.resume()
//
//    }
    
    

    
    
    
}
