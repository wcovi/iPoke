//
//  PokedexCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

protocol CellSelectionDelegate: AnyObject {
    func didSelectCell(with data: Pokedex)
}

class PokedexCollectionViewCellScreen: UIView {

    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.backgroundColor = .white
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var pokeballImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.image = UIImage(named: "PokeBolaCompleteWhite")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var numberPokeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var typePrimaryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var typeSecundaryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(backgroundImage)
        addSubview(pokeballImage)
        addSubview(numberPokeLabel)
        addSubview(nameLabel)
        addSubview(pokemonImage)
        addSubview(typePrimaryImage)
        addSubview(typeSecundaryImage)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([

            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pokeballImage.topAnchor.constraint(equalTo: topAnchor, constant: -5),
            pokeballImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokeballImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
            pokeballImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            pokeballImage.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: -50),
            
            pokemonImage.topAnchor.constraint(equalTo: topAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: pokemonImage.topAnchor, constant: 135),
            
            numberPokeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            numberPokeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
    
            typePrimaryImage.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 36),
            typePrimaryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            typePrimaryImage.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -1),
            typePrimaryImage.heightAnchor.constraint(equalToConstant: 25),
            
            typeSecundaryImage.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 36),
            typeSecundaryImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            typeSecundaryImage.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 1),
            typeSecundaryImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            typeSecundaryImage.heightAnchor.constraint(equalToConstant: 25),
            typeSecundaryImage.widthAnchor.constraint(equalToConstant: 62),
        ])
    }
}
 
