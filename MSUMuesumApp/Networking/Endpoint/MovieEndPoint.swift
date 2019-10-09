////
////  MovieEndPoint.swift
////  MSUMuesumApp
////
////  Created by Anderson Day on 10/2/19.
////  Copyright © 2019 Anderson Day. All rights reserved.
////
//
//import Foundation
//
//public enum MovieApi {
//    case recommended(id:Int)
//    case popular(page:Int)
//    case newMovies(page:Int)
//    case video(id:Int)
//}
//
//extension MovieApi: EndPointType {
//    
//    var environmentBaseURL : String {
//        switch NetworkManager.environment {
//        case .production: return "https://api.themoviedb.org/3/movie/"
//        }
//    }
//    
//    var baseURL: URL {
//        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
//        return url
//    }
//    
//    var path: String {
//        switch self {
//        case .recommended(let id):
//            return "\(id)/recommendations"
//        case .popular:
//            return "popular"
//        case .newMovies:
//            return "now_playing"
//        case .video(let id):
//            return "\(id)/videos"
//        }
//    }
//    
//    var httpMethod: HTTPMethod {
//        return .get
//    }
//    
//    var task: HTTPTask {
//        switch self {
//        case .newMovies(let page):
//            return .requestParameters(bodyParameters: nil,
//                                      bodyEncoding: .urlEncoding,
//                                      urlParameters: ["page":page,
//                                                      "api_key":NetworkManager.MovieAPIKey])
//        default:
//            return .request
//        }
//    }
//    
//    var headers: HTTPHeaders? {
//        return nil
//    }
//}
//
