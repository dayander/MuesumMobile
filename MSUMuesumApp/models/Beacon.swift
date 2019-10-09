//
//  Beacon.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/2/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation

struct Beacon {
    
    var id: Int
    var identifier: String
    var payload: Payload
    
}

extension Beacon: Decodable {
    enum BeaconCodingKeys: String, CodingKey {
        case id = "_id"
        case identifier = "identifier"
        case payload = "payload"
    }
    
    init(decoder: Decoder) throws {
        let beaconContainer = try decoder.container(keyedBy: BeaconCodingKeys.self)
         id =  try beaconContainer.decode(Int.self, forKey: .id)
         identifier = try beaconContainer.decode(String.self, forKey: .identifier)
         payload = try beaconContainer.decode(Payload.self, forKey: .payload)
    }
}
