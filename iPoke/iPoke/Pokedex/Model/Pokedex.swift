//
//  Pokedex.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import Foundation

struct Pokedex: Codable {
    var nameLabel: String
    var nameImage: String
    var typeLabel: String
    var backgroundImage: String
    var primaryType: String
    var secundaryType: String
    var originalIndex: Int
}
