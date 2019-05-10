//
//  exhibit.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 4/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation
import UIKit

struct Museum{
    var rooms: [Room]
}


struct Room {
    let name: String
    let id: String
    let device: Beacon
    var exhibits: [Exhibit]
}

struct Beacon {
    
    var id: String
    var identifier: String
    var roomName: String
    
}


struct Exhibit {
    let name: String
    let subHead: String
    let mainImg: Image
    var appSections: [AppSection]
    //let image: UIImage?
    
    
    
    
    //    func URLToUIImage(thumbanil: URL) -> UIImage {
    //        let url = NSURL(fileURLWithPath: thumbnail)
    //        let data = NSData(contentsOf: url as URL)
    //        let image = UIImage(data: data! as Data)
    //        return image!
    //    }
    //
    //    enum ExhibitCodingKeys: String, CodingKey {
    //        case name = "name"
    //        case title = "title"
    //        case description = "description"
    //        case thumbnail = "tumbnail"
    //        //case image = "image"
    //    }
    
    
    
}


struct AppSection{
    let id: String
    let sectionHeading: String
    let sectionImagePath:String
    let sectionImageAltText: String
    let sectionDescription: String
    let order: Int
}




struct Image {
    let altText: String
    let path: String
}














enum floorLevel{
    
    case groundFloor
    case firstFloor
    case secondFloor
}

