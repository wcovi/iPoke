//
//  PokemonDataManager.swift
//  iPoke
//
//  Created by Yan Alejandro on 08/07/23.
//

import Foundation

class PokemonDataManager {
    func loadPokemonData() -> [Pokemon]? {
        guard let jsonPath = Bundle.main.path(forResource: "pokemonData", ofType: "json") else {
            // Arquivo JSON não encontrado
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
            let decoder = JSONDecoder()
            let pokemonData = try decoder.decode([Pokemon].self, from: jsonData)
            
            return pokemonData
        } catch {
            // Erro ao carregar ou decodificar os dados do arquivo JSON
            print("Erro ao carregar ou decodificar o arquivo JSON:", error)
            return nil
        }
    }
}
