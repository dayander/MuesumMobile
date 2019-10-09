//
//  Payload.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/2/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation

struct Payload: Decodable {
    var roomName: String
    enum PayloadCodingKeys: String, CodingKey {
        case roomName
    }
}
