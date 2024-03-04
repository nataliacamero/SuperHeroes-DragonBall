//
//  Transformation.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 29/9/23.
//

import Foundation

struct Transformation: Decodable, TableViewCellRepresentable {
    let id: String
    let name: String
    let photo: URL
    let description: String
}
