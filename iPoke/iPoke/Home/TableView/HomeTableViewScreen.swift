//
//  HomeTableViewScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 09/03/23.
//

import UIKit

class HomeTableViewScreen: UIView {

    lazy var boxImageTypePokemon: UIImageView = {
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
        setUpConstraints()
    }
    
    func addSubview() {
        addSubview(boxImageTypePokemon)
        addSubview(typeLabel)
        addSubview(pokebolaImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            boxImageTypePokemon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 32.5),
            boxImageTypePokemon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            boxImageTypePokemon.heightAnchor.constraint(equalToConstant: 57),
            boxImageTypePokemon.widthAnchor.constraint(equalToConstant: 165),
            
            typeLabel.centerYAnchor.constraint(equalTo: boxImageTypePokemon.centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: boxImageTypePokemon.leadingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: pokebolaImage.leadingAnchor, constant: -20),
            typeLabel.bottomAnchor.constraint(equalTo: boxImageTypePokemon.bottomAnchor, constant: 2),
            typeLabel.heightAnchor.constraint(equalToConstant: 26),
            
            pokebolaImage.centerYAnchor.constraint(equalTo: boxImageTypePokemon.centerYAnchor),
            pokebolaImage.trailingAnchor.constraint(equalTo: boxImageTypePokemon.trailingAnchor, constant: -7),
            pokebolaImage.heightAnchor.constraint(equalToConstant: 33),
            pokebolaImage.widthAnchor.constraint(equalToConstant: 33),
        ])
    }
}
