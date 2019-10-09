//
//  exhibit.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 4/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation
import UIKit

struct Exhibit {
    let name: String
    let subHead: String
    let mainImg: Image
    var appSections: [AppSection]
    
}


extension Exhibit: Decodable {
    
    enum ExhibitCodingKeys: String, CodingKey {
        case name = "name"
        case subHead = "subHead"
        case mainImg = "mainImg"
        case appSections = "appSections"
    }
    
    
    init(from decoder: Decoder) throws {
        let exhibitContainer = try decoder.container(keyedBy: ExhibitCodingKeys.self)
        
        name = try exhibitContainer.decode(String.self, forKey: .name)
        subHead = try exhibitContainer.decode(String.self, forKey: .subHead)
        mainImg = try exhibitContainer.decode(Image.self, forKey: .mainImg)
        appSections = try exhibitContainer.decode([AppSection].self, forKey: .appSections)
    }
}

enum floorLevel{
    
    case groundFloor
    case firstFloor
    case secondFloor
}

