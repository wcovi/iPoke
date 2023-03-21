//
//  TypesTableViewCell2.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class TypesTableViewCell2: UITableViewCell {

    var dataType: [Types] = [Types(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
                             Types(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                             Types(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                             Types(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                             Types(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
                             Types(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                             Types(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                             Types(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
    ]
    
    var typesTableViewCellScreen2: TypesTableViewCellScreen2 = TypesTableViewCellScreen2()
    
    static let identifier: String = "TypesTableViewCell2"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
        typesTableViewCellScreen2.configCollectionViewProtocol(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        typesTableViewCellScreen2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typesTableViewCellScreen2)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            typesTableViewCellScreen2.topAnchor.constraint(equalTo: topAnchor),
            typesTableViewCellScreen2.leadingAnchor.constraint(equalTo: leadingAnchor),
            typesTableViewCellScreen2.trailingAnchor.constraint(equalTo: trailingAnchor),
            typesTableViewCellScreen2.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension TypesTableViewCell2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TypesCollectionViewCell2? = collectionView.dequeueReusableCell(withReuseIdentifier: TypesCollectionViewCell2.identifier, for: indexPath) as? TypesCollectionViewCell2
        cell?.setupCell(data: dataType[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hello1")
    }

}
