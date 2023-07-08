//
//  PokedexViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class PokedexViewController: UIViewController {
    
    var pokedexScreen: PokedexScreen?
    var bioCollectionScreen: BioCollectionViewCellScreen?
    
    weak var cellSelectionDelegate: CellSelectionDelegate?
    
    var selectedIndex: Int?
    var selectedType: String?
    var typeFilter: String?
    
    var filteredData: [Pokemon] = []
    
    var dataPokedex: [Pokemon] = []
    
    var allPokemons: [Pokemon] = []

    
    
    
    override func loadView() {
        pokedexScreen = PokedexScreen()
        view = pokedexScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let jsonPath = Bundle.main.path(forResource: "pokemonData", ofType: "json") else {
            print("Arquivo JSON não encontrado.")
            return
        }

        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))

            // Decodificar os dados JSON em objetos Pokemon
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([Pokemon].self, from: jsonData)

            // Atribuir os dados decodificados à propriedade filteredData
            filteredData = decodedData
            dataPokedex = decodedData

            // Definir o nome e a extensão do arquivo
            let fileName = "pokemonData"
            let fileExtension = "json"

            // Obter o diretório de documentos do aplicativo
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                print("Erro ao obter o diretório de documentos.")
                return
            }

            // Construir o caminho do arquivo
            let filePath = documentsDirectory.appendingPathComponent("\(fileName).\(fileExtension)")

            // Codificar os dados de volta em JSON com codificação UTF-8
            if let encodedData = try? JSONEncoder().encode(decodedData),
               let jsonString = String(data: encodedData, encoding: .utf8) {
                // Salvar a string JSON no arquivo especificado
                do {
                    try jsonString.write(to: filePath, atomically: true, encoding: .utf8)
                } catch {
                    print("Erro ao salvar o arquivo JSON:", error)
                }
            }

            // Atualizar a coleção com os dados carregados
            pokedexScreen?.collectionView.reloadData()
        } catch {
            print("Erro ao carregar o arquivo JSON:", error)
        }

        pokedexScreen?.delegate(delegate: self)
        pokedexScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)
        pokedexScreen?.searchTextField.delegate = self
        filteredData = dataPokedex
//        allPokemons = loadAllPokemons()
    }
    
    func filterPokemonsByType(type: String) {
        let firePokemons = allPokemons.filter { $0.primaryType.lowercased() == type.lowercased() }
    }

}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let typeFilter = typeFilter {
            return filteredData.filter { $0.name == typeFilter }.count
        } else {
            return filteredData.count
        }
    }
    
    func updateCollectionView() {
        guard let type = selectedType else { return }
        _ = dataPokedex.filter { $0.primaryType == type }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokedexCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCollectionViewCell.identifier, for: indexPath) as? PokedexCollectionViewCell
        let pokedexData = filteredData[indexPath.row]
        cell?.setupCell(data: pokedexData)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.315, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = filteredData[indexPath.row]
        let originalIndex = pokemon.id - 1
        let selectedPokemon = dataPokedex[originalIndex]
        
        cellSelectionDelegate?.didSelectCell(with: selectedPokemon)
        
        let vc = BioViewController()
        vc.data = selectedPokemon
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PokedexViewController: PokedexScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension PokedexViewController: UITextFieldDelegate {
    
    func filterData() {
        if let searchText = pokedexScreen?.searchTextField.text, !searchText.isEmpty {
            filteredData = dataPokedex.filter { $0.name.lowercased().hasPrefix(searchText.lowercased())
            }
        } else {
            filteredData = dataPokedex
        }
        pokedexScreen?.collectionView.reloadData()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        filterData()
    }
}
