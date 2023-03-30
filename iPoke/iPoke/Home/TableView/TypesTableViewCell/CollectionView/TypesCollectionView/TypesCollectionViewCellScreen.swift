//
//  TypesCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

protocol TypesCollectionScreenDelegate: AnyObject {
    func tappedButton()
}

class TypesCollectionViewCellScreen: UIView {
    
    weak private var delegate: TypesCollectionScreenDelegate?
    
    public func setUpDelegate(delegate: TypesCollectionScreenDelegate?) {
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
