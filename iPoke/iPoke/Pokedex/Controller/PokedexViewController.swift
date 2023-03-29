//
//  PokedexViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class PokedexViewController: UIViewController {

    var pokedexScreen: PokedexScreen?
    
    var dataPokedex: [Pokedex] = [Pokedex(nameLabel: "Bulbasaur", nameImage: "001", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Ivysaur", nameImage: "002", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Venusaur", nameImage: "003", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Charmander", nameImage: "004", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Charmeleon", nameImage: "005", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Charizard", nameImage: "006", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Squirtle", nameImage: "007", typeLabel: "Water"),
                                  Pokedex(nameLabel: "Wartortle", nameImage: "008", typeLabel: "Water"),
                                  Pokedex(nameLabel: "Blastoise", nameImage: "009", typeLabel: "Water"),
                                  Pokedex(nameLabel: "Bulbasaur", nameImage: "001", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Ivysaur", nameImage: "002", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Venusaur", nameImage: "003", typeLabel: "Grass"),
                                  Pokedex(nameLabel: "Charmander", nameImage: "004", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Charmeleon", nameImage: "005", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Charizard", nameImage: "006", typeLabel: "Fire"),
                                  Pokedex(nameLabel: "Squirtle", nameImage: "007", typeLabel: "Water"),
                                  Pokedex(nameLabel: "Wartortle", nameImage: "008", typeLabel: "Water"),
                                  Pokedex(nameLabel: "Blastoise", nameImage: "009", typeLabel: "Water"),
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
        pokedexScreen = PokedexScreen()
        view = pokedexScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexScreen?.delegate(delegate: self)
        pokedexScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)

    }
    
}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataPokedex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokedexCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCollectionViewCell.identifier, for: indexPath) as? PokedexCollectionViewCell
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

extension PokedexViewController: PokedexScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
