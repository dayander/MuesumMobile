//
//  RoomName.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/2/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation

struct RoomName: Decodable {
    var roomName: String
    enum RoomNameCodingKeys: String, CodingKey {
        case roomName
    }
}
