////
////  PokemonService.swift
////  iPoke
////
////  Created by Yan Alejandro on 19/06/23.
////
//
//import UIKit
//import Alamofire
//
//class PokemonService {
//    var completionHandler: (() -> Void)?
//    var allPokemon: [Pokemon] = []
//    
//    func fetchPokemonDetails(completion: @escaping ([Pokemon]) -> Void) {
//        let url = "https://pokeapi.co/api/v2/pokemon/"
//        
//        AF.request(url).responseDecodable(of: Pokemon.self) { response in
//            switch response.result {
//            case .success(let pokemon):
//                let pokemonList = [pokemon] // Colocando o resultado em uma lista para manter a consistência com a função fetchAllPokemons
//                completion(pokemonList)
//            case .failure(let error):
//                print("Erro: \(error)")
//                completion([])
//            }
//        }
//    }
//    
//    func fetchAllPokemons(completion: @escaping ([Pokemon]?) -> Void) {
//        var allPokemon: [Pokemon] = []
//        let limit = 100
//        
//        func fetchNextPokemonPage(offset: Int) {
//            fetchPokemonPage(offset: offset, limit: limit) { [weak self] pokemonPage in
//                allPokemon.append(contentsOf: pokemonPage.results)
//                
//                if offset + limit < pokemonPage.count {
//                    fetchNextPokemonPage(offset: offset + limit)
//                } else {
//                    self?.allPokemon = allPokemon
//                    self?.completionHandler?()
//                }
//            }
//        }
//        
//        fetchNextPokemonPage(offset: 0)
//    }
//    
//    private func fetchNextPokemonPage(offset: Int, limit: Int, allPokemon: [Pokemon]) {
//        fetchPokemonPage(offset: offset, limit: limit) { [weak self] pokemonPage in
//            var updatedPokemon = allPokemon
//            updatedPokemon.append(contentsOf: pokemonPage.results)
//            
//            let nextPageOffset = offset + limit
//            guard nextPageOffset < pokemonPage.count else {
//                self?.allPokemon = updatedPokemon
//                self?.completionHandler?()
//                return
//            }
//            
//            self?.fetchNextPokemonPage(offset: nextPageOffset, limit: limit, allPokemon: updatedPokemon)
//        }
//    }
//    
//    private func fetchPokemonPage(offset: Int, limit: Int, completion: @escaping (PokemonPage) -> Void) {
//        let url = "https://pokeapi.co/api/v2/pokemon/"
//        
//        AF.request(url, parameters: ["offset": offset, "limit": limit]).responseDecodable(of: PokemonPage.self) { response in
//            switch response.result {
//            case .success(let pokemonPage):
//                completion(pokemonPage)
//            case .failure(let error):
//                print("Error fetching Pokémon page: \(error)")
//                completion(PokemonPage(results: [], count: 0))
//            }
//        }
//    }
//}
//
//
//
////class PokemonService {
////
////    var dataPokedex: [PokemonData] = []
////    var pokemonImageURLs: [URL] = []
////    var imageCache: [URL: UIImage] = [:]
////    var completionHandler: (() -> Void)?
////    let limit = 1000
////    var pokemonID: Int?
////
////    func fetchAllPokemons() {
////        let url = "https://pokeapi.co/api/v2/pokemon?limit=1010"
////        var imageURLs: [URL] = []
////
////        AF.request(url).responseDecodable(of: PokemonResponse.self) { [weak self] response in
////            switch response.result {
////            case .success(let pokemonResponse):
////                self?.dataPokedex = pokemonResponse.results
////
////                // Armazenar as URLs das imagens
////                imageURLs = self?.getPokemonImageURLs(limit: pokemonResponse.results.count) ?? []
////
////                // Imprimir as URLs das imagens
////                for url in imageURLs {
////                    print("Image URL: \(url)")
////                }
////
////                self?.pokemonImageURLs = imageURLs // Atribuir as URLs ao array de imagens
////
////                // Extrair e armazenar o ID do Pokémon
////                for (index, pokemon) in self?.dataPokedex.enumerated() ?? [].enumerated() {
////                    let id = self?.extractPokemonID(from: pokemon.url) ?? 0
////                    self?.pokemonID = id
////                    print("ID do Pokémon no índice \(index): \(id)")
////                }
////
////                self?.completionHandler?()
////
////            case .failure(let error):
////                print("Erro: \(error)")
////            }
////        }
////    }
////
////
////    func getPokemonImageURLs(limit: Int) -> [URL] {
////        var imageURLs: [URL] = []
////
////        for pokemonID in 1...limit {
////            let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
////            if let imageURL = URL(string: imageURLString) {
////                imageURLs.append(imageURL)
////            }
////        }
////
////        for url in imageURLs {
////            print("Image URL: \(url)")
////        }
////
////        return imageURLs
////    }
////
////    func fetchPokemonDetails(url: String) {
////        AF.request(url).responseDecodable(of: PokemonData.self) { [self] response in
////            switch response.result {
////            case .success(let pokemonData):
////                let id = extractPokemonID(from: pokemonData.url)
////                pokemonID = id
////                let imageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
////                let pokemonWithImageURL = PokemonData(name: pokemonData.name, url: pokemonData.url, imageURL: imageURL)
////                // Agora você pode usar o objeto `pokemonWithImageURL` que inclui a URL da imagem
////            case .failure(let error):
////                print("Erro ao obter detalhes do Pokémon: \(error)")
////            }
////        }
////    }
////
////    func extractPokemonID(from url: String) -> Int {
////        let regexPattern = #"\/(\d+)\/$"#
////        // Expressão regular para buscar o número entre barras na última posição da URL
////        let regex = try! NSRegularExpression(pattern: regexPattern, options: [])
////        let range = NSRange(location: 0, length: url.count)
////        let matches = regex.matches(in: url, options: [], range: range)
////
////        if let match = matches.first {
////            let idRange = match.range(at: 1)
////            if let range = Range(idRange, in: url), let id = Int(url[range]) {
////                return id
////            }
////        }
////
////        return 0
////    }
////
////}
////
////
