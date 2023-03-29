//
//  FavoriteViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var favoriteScreen: FavoriteScreen?
    
    var dataPokedex: [Pokedex] = [
                                  Pokedex(nameLabel: "Venusaur", nameImage: "003", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Charizard", nameImage: "006", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Blastoise", nameImage: "009", typeLabel: "Water"),
                                  Pokedex(nameLabel: "Charmander", nameImage: "004", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Squirtle", nameImage: "007", typeLabel: "Water"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "010", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "011", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "012", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "013", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "014", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "015", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "016", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "017", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "018", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "019", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "020", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "021", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "022", typeLabel: "Grass"),
//                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "023", typeLabel: "Grass"),
    ]
    
    override func loadView() {
        favoriteScreen = FavoriteScreen()
        view = favoriteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        favoriteScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataPokedex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.identifier, for: indexPath) as? FavoriteCollectionViewCell
        cell?.setupCell(data: dataPokedex[indexPath.row])
        cell?.backgroundColor = .white
        cell?.layer.cornerRadius = 15
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.315, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BioViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
