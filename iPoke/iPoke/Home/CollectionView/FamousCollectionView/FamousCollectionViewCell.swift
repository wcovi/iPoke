//
//  FamousCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

class FamousCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TypesCollectionViewCell"
    var data: [Famous] = []
    
    let famousCollectionViewScreen: FamousCollectionViewScreen = FamousCollectionViewScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Famous) {
        famousCollectionViewScreen.imageTypePokemon.image = UIImage(named: data.nameImage)
        famousCollectionViewScreen.typeLabel.text = data.nameType
        famousCollectionViewScreen.pokebolaImage.image = UIImage(named: data.pokeImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        geracaoCollectionViewCellScreen.layer.borderWidth = 1.0
//        geracaoCollectionViewCellScreen.layer.borderColor = UIColor.white.cgColor
        famousCollectionViewScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(famousCollectionViewScreen)
    }
    
    public func dataCollection(data: [Famous]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            famousCollectionViewScreen.topAnchor.constraint(equalTo: topAnchor),
            famousCollectionViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            famousCollectionViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            famousCollectionViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
