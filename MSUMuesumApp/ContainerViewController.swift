//
//  ContainerViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 4/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import SwiftyJSON

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var testImage: UIImageView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var   museumRooms = [Room]()
    
      var delegate: ObserverDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        getData()
        
        
        
        if museumRooms.count > 0 {
            guard let url = URL(string:museumRooms[0].exhibits[0].mainImg.path) else { return  }
            
            
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    testImage.image = image
                }
            }
        }
    }
    
    
    
    
    func getData(){
        
        var rooms = [Room]()
        
        let url = URL(string:"http://msu-museum-server.herokuapp.com/getrooms")!
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if let data = data{
                let json = JSON(data)
                
                //loops through only the rooms //for each room
                for (key,subJson):(String, JSON) in json {
                    
                    
                    var roomName = ""
                    var roomId = ""
                    
                    var beacon = Beacon(id: "", identifier: "", roomName: "")
                    
                    var exhibits = [Exhibit]()
                    
                    //exposes device, exhibits array, Gives you room name and room id
                    for (i, sj) in subJson{
                        
                        
                        if(i == "name"){
                            roomName = sj.stringValue
                            
                        }
                        if(i == "_id"){
                            roomId = sj.stringValue
                            
                        }
                        
                        if(i == "device"){
                            
                            beacon.id = sj["id"].stringValue
                            beacon.identifier = sj["identifier"].stringValue
                            beacon.roomName = sj["payload"]["roomName"].stringValue
                            
                        }
                        
                        
                        if(i == "exhibits"){
                            for(k, v) in sj{
                                //v is an exhibit obj
                                let name = v["name"].stringValue
                                let subHead = v["subHead"].stringValue
                                let mainImg = Image(altText:v["mainImg"]["altText"].stringValue, path: v["mainImg"]["path"].stringValue )
                                
                                
                                
                                
                                var appSections = [AppSection]()
                                
                                if(v["appSections"].arrayValue.count != 0){
                                    
                                    let test = v["appSections"].arrayValue
                                    
                                    for (obj):(JSON) in test {
                                        
                                        appSections.append(AppSection(id: obj["_id"].stringValue, sectionHeading: obj["sectionHeading"].stringValue, sectionImagePath: obj["sectionImagePath"].stringValue, sectionImageAltText: obj["sectionImageAltText"].stringValue, sectionDescription: obj["sectionDescription"].stringValue, order: Int(truncating: obj["order"].numberValue)))
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                let exhibit = Exhibit(name: name, subHead: subHead, mainImg: mainImg, appSections: appSections)
                                
                                exhibits.append(exhibit)
                            }
                        }
                        
                        
                        
                    }
                    
                    
                    
                    rooms.append(Room(name: roomName, id: roomId, device: beacon, exhibits: exhibits))
                    
                    
                    
                    
                    
                    
                }
                
                
                self.museumRooms = rooms
                
                print("self", self.museumRooms)
                
            }
            
            
            if let error = error{
                print("error", error)
            }
            
        }
        
        
        task.resume()
        
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
        
        print("id", segue.identifier)
        
        if segue.identifier == "ToClosestExhibits"{
            
            
            
            if let destination = segue.destination as? ClosestExhibitViewController{
                destination.rooms = self.museumRooms
                
                
            }
            
            
            
        }
    }

}


protocol ObserverDelegate {
    func updateRoomBasedOnTag(tag:String)
    
    
}
