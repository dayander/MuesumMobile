//
//  Image.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/2/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import Foundation
import UIKit

struct Image {
    let altText: String
    let path: String
    let url: URL
    let data: Data
    let img: UIImage
}

extension Image: Decodable {
    enum ImageCodingKeys: String, CodingKey {
        case altText = "altText"
        case path = "path"
    }
    
    init(from decoder: Decoder) throws {
           let imageContainer = try decoder.container(keyedBy: ImageCodingKeys.self)
        altText = try imageContainer.decode(String.self, forKey: .altText)
        path = try imageContainer.decode(String.self, forKey: .path)
        url = URL(string: "https://msu-museum-server.herokuapp.com" + path)!
        data = try Data(contentsOf: url)
        img = UIImage(data: data)!
    }
}
