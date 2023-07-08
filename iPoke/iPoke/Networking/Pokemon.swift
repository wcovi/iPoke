//
//  PokemonAPI.swift
//  iPoke
//
//  Created by Yan Alejandro on 08/07/23.
//

struct Pokemon: Codable {
    let name: String
    let id: Int
    let imageUrl: String
    let primaryType: String
    let secondaryType: String?
}

