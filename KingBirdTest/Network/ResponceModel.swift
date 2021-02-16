//
//  ResponceModel.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//

import Foundation
struct ResponceModel: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let imgSrc: String
    enum CodingKeys: String, CodingKey {
        case id
        case imgSrc = "img_src"
    }
}

