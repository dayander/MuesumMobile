//
//  Rooms.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation

struct Room {
    let name: String
    let id: String
    let device: Beacon
    let exhibits: [Exhibit]
    //need to add floors
}

extension Room: Decodable {
        enum RoomCodingKeys: String, CodingKey {
        case name = "name"
        case id = "_id"
        case device = "device"
        case exhibits = "exhibits"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RoomCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(String.self, forKey: .id)
        device = try container.decode(Beacon.self, forKey: .device)
        exhibits = try container.decode([Exhibit].self, forKey: .exhibits)
        
    }
}

struct RoomApiResponse {
    let rooms: [Room]
}

extension RoomApiResponse: Decodable {
    private enum RoomApiResponseCodingKeys: String, CodingKey {
        case rooms
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RoomApiResponseCodingKeys.self)
        rooms = try container.decode([Room].self, forKey: .rooms)
    }
    
}




