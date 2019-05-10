//
//  QueryService.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 4/4/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation
import SwiftyJSON


class QueryService{
    
    
    
    func getRooms() {
       
        let url = URL(string:"http://msu-museum-server.herokuapp.com/getrooms")!
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if let data = data{
                let json = JSON(data)
                //gets room name of first room
                //print(people[0]["name"])
                print(json[0]["name"])
                //loops through only the rooms //for each room
                for (key,subJson):(String, JSON) in json {
                    // Do something you want
                    
                    //exposes device, exhibits array, Gives you room name and room id
                    for (i, sj) in subJson{
                        print("check check", i, sj)
                    }
                    
                    
                }
                
                
            }
            
            
            //            if let data = data,
            //                let string = String(data: data, encoding: .utf8){
            //                print(string)
            //            }
            
            if let response = response{
                print("response",response)
            }
            
            if let error = error{
                print("error", error)
            }
            
        }
        
        
        task.resume()
    }
    
    
    
    func updateRoomsWithData(data: Data){
        
    }
}
