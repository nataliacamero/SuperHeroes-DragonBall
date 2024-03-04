//
//  Hero.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 29/9/23.
//

import Foundation

struct Hero: Decodable, TableViewCellRepresentable {
    let id: String
    let name: String
    let description: String
    let photo: URL
    let favorite: Bool
}
