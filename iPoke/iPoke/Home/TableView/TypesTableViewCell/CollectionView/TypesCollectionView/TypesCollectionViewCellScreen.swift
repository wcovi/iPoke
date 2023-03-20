//
//  TypesCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

protocol TypesScreenDelegate: AnyObject {
    func tappedButton()
}

class TypesCollectionViewCellScreen: UIView {
    
    private var delegate: TypesScreenDelegate?

    lazy var typePokemonButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pokedéx", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.addTarget(self, action: #selector(tappedPokedexButton), for: .touchUpInside)
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
    
    @objc func tappedPokedexButton() {
        delegate?.tappedButton()
    }
    
    func addSubview() {
        addSubview(typePokemonButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            typePokemonButton.topAnchor.constraint(equalTo: topAnchor),
            typePokemonButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            typePokemonButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            typePokemonButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            typePokemonButton.widthAnchor.constraint(equalToConstant: 165),
            typePokemonButton.heightAnchor.constraint(equalToConstant: 57),
        ])
    }
}
