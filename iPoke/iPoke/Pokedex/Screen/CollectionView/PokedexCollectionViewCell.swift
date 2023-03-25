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
    
    
    let pokedexCollectionViewCellScreen: PokedexCollectionViewCellScreen = PokedexCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Pokedex) {
        pokedexCollectionViewCellScreen.nameLabel.text = data.nameLabel
        pokedexCollectionViewCellScreen.pokemonImage.image = UIImage(named: data.nameImage)
        pokedexCollectionViewCellScreen.typeButton.setTitle(data.typeLabel, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        pokedexCollectionViewCellScreen.layer.borderWidth = 3.0
//        pokedexCollectionViewCellScreen.layer.borderColor = UIColor.orange.cgColor
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
