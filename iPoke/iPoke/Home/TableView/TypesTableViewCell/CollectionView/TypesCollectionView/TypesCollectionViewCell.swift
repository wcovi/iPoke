//
//  TypesCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

class TypesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TypesCollectionViewCell"
    var data: [Types] = []
    
    let typesCollectionViewCellScreen: TypesCollectionViewCellScreen = TypesCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Types) {
        typesCollectionViewCellScreen.typePokemonButton.setImage(UIImage(named: data.nameImage), for: .normal)
        typesCollectionViewCellScreen.typeLabel.text = data.nameType
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
