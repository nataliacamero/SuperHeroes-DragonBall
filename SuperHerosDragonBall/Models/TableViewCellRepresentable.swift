//
//  TableViewCellRepresentable.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 7/3/24.
//

import Foundation

protocol TableViewCellRepresentable {
    var photo: URL { get }
    var name: String { get }
    var description: String { get }
}
