//
//  Hero.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 29/9/23.
//

import Foundation

struct Hero: Decodable, CommonInfo {
    let id: String
    let name: String
    let description: String
    let photo: URL
    let favorite: Bool
}


// MARK: - Custome conformance
//extension Hero: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case description
//        case photo
//        case favourite = "favorite"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(String.self, forKey: .id)
//        name = try values.decode(String.self, forKey: .name)
//        description = try values.decode(String.self, forKey: .description)
//        photo = try values.decode(URL.self, forKey: .photo)
//        favourite = try values.decode(Bool.self, forKey: .favourite)
//    }
//}
