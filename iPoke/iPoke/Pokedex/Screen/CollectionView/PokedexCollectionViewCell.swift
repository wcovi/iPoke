//
//  PokedexCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class PokedexCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PokedexCollectionViewCell"
    var data: [Pokedex] = []
    
    var controller = PokedexViewController()
    
    let pokedexCollectionViewCellScreen: PokedexCollectionViewCellScreen = PokedexCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Pokedex) {
        pokedexCollectionViewCellScreen.backgroundImage.image = UIImage(named: data.backgroundImage)
        pokedexCollectionViewCellScreen.numberPokeLabel.text = data.nameImage
        pokedexCollectionViewCellScreen.nameLabel.text = data.nameLabel
        pokedexCollectionViewCellScreen.pokemonImage.image = UIImage(named: data.nameImage)
        pokedexCollectionViewCellScreen.typePrimaryImage.image = UIImage(named: data.primaryType)
        pokedexCollectionViewCellScreen.typeSecundaryImage.image = UIImage(named: data.secundaryType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        pokedexCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokedexCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [Pokedex]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            pokedexCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            pokedexCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokedexCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokedexCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
