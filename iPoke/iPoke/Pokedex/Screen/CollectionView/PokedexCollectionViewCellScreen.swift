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
        return image
    }()
    
    lazy var typeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(nameLabel)
        addSubview(pokemonImage)
        addSubview(typeButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 135),
            pokemonImage.heightAnchor.constraint(equalToConstant: 135),
            
            typeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            typeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            typeButton.widthAnchor.constraint(equalToConstant: 60),
            typeButton.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
}
 
