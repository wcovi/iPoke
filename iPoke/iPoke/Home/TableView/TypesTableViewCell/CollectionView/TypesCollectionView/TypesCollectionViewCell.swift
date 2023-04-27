//
//  TypesCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

protocol CollectionViewSelectionDelegate: AnyObject {
    func didSelectType(_ type: String)
}

class TypesCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CollectionViewSelectionDelegate?
    
    static let identifier: String = "TypesCollectionViewCell"
    var data: [Types] = []
    
    var pokedexViewController: PokedexViewController?
    
    let typesCollectionViewCellScreen: TypesCollectionViewCellScreen = TypesCollectionViewCellScreen()
    
    var type: String? {
            didSet {
                // Atualiza a célula com o tipo selecionado
            }
        }

    func didSelectCell() {
        if let type = self.type {
            delegate?.didSelectType(type)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Types) {
        typesCollectionViewCellScreen.typePokemonButton.setBackgroundImage(UIImage(named: data.typeButton), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//                typesCollectionViewCellScreen.layer.borderWidth = 1.0
//                typesCollectionViewCellScreen.layer.borderColor = UIColor.white.cgColor
        typesCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typesCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [Types]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            typesCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            typesCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            typesCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            typesCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
