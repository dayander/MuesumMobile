//
//  AppSection.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/2/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation

struct AppSection{
    let id: String
    let sectionHeading: String
    let sectionImagePath:String
    let sectionImageAltText: String
    let sectionDescription: String
    let order: Int?
}

extension AppSection: Decodable {
    enum AppSectionCodingKeys: String, CodingKey {
        case id = "_id"
        case sectionHeading = "sectionHeading"
        case sectionImagePath = "sectionImagePath"
        case sectionImageAltText = "sectionImageAltText"
        case sectionDescription = "sectionDescription"
        case order = "order"
    }
    
    init(from decoder: Decoder) throws {
        let appSectionContainer = try decoder.container(keyedBy: AppSectionCodingKeys.self)
         id = try appSectionContainer.decode(String.self, forKey: .id)
         sectionHeading = try appSectionContainer.decode(String.self, forKey: .sectionHeading)
         sectionImagePath = try appSectionContainer.decode(String.self, forKey: .sectionImagePath)
         sectionImageAltText = try appSectionContainer.decode(String.self,  forKey: .sectionImageAltText)
         sectionDescription = try appSectionContainer.decode(String.self, forKey: .sectionDescription)
         order = try appSectionContainer.decode(Int.self, forKey: .order)
        
    }
}
