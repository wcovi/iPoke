//
//  FavoriteCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 25/03/23.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FavoriteCollectionViewCell"
    var data: [Pokedex] = []
    
    
    let favoriteCollectionViewCellScreen: FavoriteCollectionViewCellScreen = FavoriteCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Pokedex) {
        favoriteCollectionViewCellScreen.nameLabel.text = data.nameLabel
        favoriteCollectionViewCellScreen.pokemonImage.image = UIImage(named: data.nameImage)
        favoriteCollectionViewCellScreen.typeButton.setTitle(data.typeLabel, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        favoriteCollectionViewCellScreen.layer.borderWidth = 3.0
//        favoriteCollectionViewCellScreen.layer.borderColor = UIColor.orange.cgColor
        favoriteCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoriteCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [Pokedex]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            favoriteCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            favoriteCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
