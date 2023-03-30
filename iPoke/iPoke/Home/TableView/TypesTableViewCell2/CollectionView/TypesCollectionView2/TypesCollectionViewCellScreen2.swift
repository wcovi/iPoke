//
//  TypesCollectionViewCellScreen2.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

protocol TypesCollectionScreenDelegate2: AnyObject {
    func tappedButton()
}

class TypesCollectionViewCellScreen2: UIView {
    
    weak private var delegate: TypesCollectionScreenDelegate2?
    
    public func setUpDelegate(delegate: TypesCollectionScreenDelegate2?) {
        self.delegate = delegate
    }

    lazy var typePokemonButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedPokedexButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedPokedexButton() {
        self.delegate?.tappedButton()
    }
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
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
        addSubview(typePokemonButton)
        addSubview(typeLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            typePokemonButton.topAnchor.constraint(equalTo: topAnchor),
            typePokemonButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            typePokemonButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            typePokemonButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            typePokemonButton.widthAnchor.constraint(equalToConstant: 165),
            typePokemonButton.heightAnchor.constraint(equalToConstant: 57),
            
            typeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: typePokemonButton.trailingAnchor, constant: 0),
            typeLabel.bottomAnchor.constraint(equalTo: typePokemonButton.bottomAnchor, constant: 2),
            typeLabel.heightAnchor.constraint(equalToConstant: 26),
            
            //            pokebolaImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            //            pokebolaImage.trailingAnchor.constraint(equalTo: imageTypePokemon.trailingAnchor, constant: -7),
            //            pokebolaImage.heightAnchor.constraint(equalToConstant: 33),
            //            pokebolaImage.widthAnchor.constraint(equalToConstant: 33),
        ])
    }

}
