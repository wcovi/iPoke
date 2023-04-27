//
//  BioCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 29/03/23.
//

import UIKit

class BioCollectionViewCell: UICollectionViewCell {
    
    var data: Pokedex?
    
    static let identifier: String = "BioCollectionViewCell"
    
    let bioCollectionViewCellScreen: BioCollectionViewCellScreen = BioCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        pokedexCollectionViewCellScreen.layer.borderWidth = 3.0
//        pokedexCollectionViewCellScreen.layer.borderColor = UIColor.orange.cgColor
        bioCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bioCollectionViewCellScreen)
    }
    
    func setupCell(data: PokeBio) {
//        bioCollectionViewCellScreen.pokemonImageView.image = UIImage(named: data.nameImage)
//        bioCollectionViewCellScreen.primaryTypeImage.image = UIImage(named: data.primaryType)
//        bioCollectionViewCellScreen.secundaryTypeImage.image = UIImage(named: data.secundaryType)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            bioCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            bioCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            bioCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            bioCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
