//
//  TypesCollectionViewCell2.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class TypesCollectionViewCell2: UICollectionViewCell {
    
    static let identifier: String = "TypesCollectionViewCell2"
    var data: [Types] = []
    
    let typesCollectionViewCellScreen2: TypesCollectionViewCellScreen2 = TypesCollectionViewCellScreen2()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Types) {
        typesCollectionViewCellScreen2.typePokemonButton.setImage(UIImage(named: data.nameImage), for: .normal)
        typesCollectionViewCellScreen2.typeLabel.text = data.nameType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//                typesCollectionViewCellScreen.layer.borderWidth = 1.0
//                typesCollectionViewCellScreen.layer.borderColor = UIColor.white.cgColor
        typesCollectionViewCellScreen2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typesCollectionViewCellScreen2)
    }
    
    public func dataCollection(data: [Types]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            typesCollectionViewCellScreen2.topAnchor.constraint(equalTo: topAnchor),
            typesCollectionViewCellScreen2.leadingAnchor.constraint(equalTo: leadingAnchor),
            typesCollectionViewCellScreen2.trailingAnchor.constraint(equalTo: trailingAnchor),
            typesCollectionViewCellScreen2.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
