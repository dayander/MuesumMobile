//
//  RoomsEndpoint.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/1/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation

public enum NetworkEnvironment {
    case production
}

public enum RoomAPI {
    case getrooms
}

extension RoomAPI: EndPointType {
    
    var environmentBaseURL : String {
        return "https://msu-museum-server.herokuapp.com"
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getrooms:
            return "/getrooms"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
