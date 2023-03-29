//
//  PokedexCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class PokedexCollectionViewCellScreen: UIView {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var typeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return button
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
        addSubview(nameLabel)
        addSubview(pokemonImage)
        addSubview(favoriteButton)
        addSubview(typeButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([

            pokemonImage.topAnchor.constraint(equalTo: topAnchor),
            pokemonImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: pokemonImage.topAnchor, constant: 135),
            
            nameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            
            typeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            typeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            typeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            typeButton.widthAnchor.constraint(equalToConstant: 60),
            typeButton.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
}
 
