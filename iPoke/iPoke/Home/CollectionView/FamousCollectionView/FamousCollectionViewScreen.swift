//
//  FamousCollectionViewScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

class FamousCollectionViewScreen: UIView {

    lazy var imageTypePokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var pokebolaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        addSubview(imageTypePokemon)
        addSubview(typeLabel)
        addSubview(pokebolaImage)

    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            imageTypePokemon.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageTypePokemon.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageTypePokemon.widthAnchor.constraint(equalToConstant: 165),
            
            typeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: imageTypePokemon.leadingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: pokebolaImage.leadingAnchor, constant: -20),
            typeLabel.bottomAnchor.constraint(equalTo: imageTypePokemon.bottomAnchor, constant: 2),
            typeLabel.heightAnchor.constraint(equalToConstant: 26),
            
            pokebolaImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokebolaImage.trailingAnchor.constraint(equalTo: imageTypePokemon.trailingAnchor, constant: -7),
            pokebolaImage.heightAnchor.constraint(equalToConstant: 33),
            pokebolaImage.widthAnchor.constraint(equalToConstant: 33),
        ])
    }
}
