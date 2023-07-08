//
//  FavoriteViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

protocol FavoriteViewControllerDelegate: AnyObject {
    func tappedFavoriteButton(data: Pokedex)
}

class FavoriteViewController: UIViewController {
    
    weak var delegate: FavoriteViewControllerDelegate?
    
    var favoriteScreen: FavoriteScreen?
    var bioCollectionScreen: BioCollectionViewCellScreen?
    weak var cellFavoriteSelectionDelegate: CellFavoriteSelectionDelegate?
    
    var selectedIndex: Int?
    var selectedType: String?
    
    var dadosRecebidos: [Pokedex] = []
    
    var filteredData: [Pokedex] = []
    
//    var dataPokedex: [Pokemon] = [Pokedex(nameLabel: "Bulbasaur", nameImage: "001", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 0),
//                                  Pokedex(nameLabel: "Ivysaur", nameImage: "002", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 1),
//                                  Pokedex(nameLabel: "Venusaur", nameImage: "003", typeLabel: "Grass", backgroundImage: "grass", primaryType: "grassType", secundaryType: "poisonType", originalIndex: 2),
//                                  Pokedex(nameLabel: "Charmander", nameImage: "004", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 3),
//                                  Pokedex(nameLabel: "Charmeleon", nameImage: "005", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "", originalIndex: 4),
//                                  Pokedex(nameLabel: "Charizard", nameImage: "006", typeLabel: "Fire", backgroundImage: "fire", primaryType: "fireType", secundaryType: "flyingType", originalIndex: 5),
//    ]
    
    override func loadView() {
        favoriteScreen = FavoriteScreen()
        view = favoriteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        favoriteScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)
//        filteredData = dataPokedex

    }
    
    @objc func handleFavoriteButtonTapped() {
//        // Verifique se a propriedade favoriteData contém os dados necessários
//        guard let data = self.dataPokedex else {
//                print("DEU RUIM: favoriteData em FavoriteViewController é nulo")
//                return
//            }
//
//            // Faça algo com os dados
//            // Exemplo: Imprima os dados
//            print("Botão favorito clicado. Dados: \(data)")
//            
//            // Chame o delegate para informar sobre o botão favorito clicado
//            delegate?.tappedFavoriteButton(data: data)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dadosRecebidos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.identifier, for: indexPath) as? FavoriteCollectionViewCell
        _ = filteredData[indexPath.row]
        let recebidos = dadosRecebidos[indexPath.row]
            
        cell?.favoriteCollectionViewCellScreen.backgroundImage.image = UIImage(named: recebidos.backgroundImage)
        cell?.favoriteCollectionViewCellScreen.numberPokeLabel.text = recebidos.nameImage
        cell?.favoriteCollectionViewCellScreen.nameLabel.text = recebidos.nameLabel
        cell?.favoriteCollectionViewCellScreen.pokemonImage.image = UIImage(named: recebidos.nameImage)
        cell?.favoriteCollectionViewCellScreen.typePrimaryImage.image = UIImage(named: recebidos.primaryType)
        cell?.favoriteCollectionViewCellScreen.typeSecundaryImage.image = UIImage(named: recebidos.secundaryType)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.315, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = filteredData[indexPath.row]
        let originalIndex = pokemon.originalIndex
//        let selectedPokemon = dataPokedex[originalIndex]
        
        
        let vc = BioViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension FavoriteViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is FavoriteViewController {
            // Atualize os dados na tela de favoritos, se necessário
        }
    }
}
