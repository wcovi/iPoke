//
//  TypesTableViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 09/03/23.
//

import UIKit

class TypesTableViewCell: UITableViewCell {
    
    var dataType: [Types] = [Types(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                             Types(nameType: "Pokedex", nameImage: "yellowCard", pokeImage: "pokebola"),
                             Types(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                             Types(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
                             Types(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                             Types(nameType: "Pokedex", nameImage: "yellowCard", pokeImage: "pokebola"),
                             Types(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                             Types(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
    ]
    
    let cellDimension : CGFloat = 380
    let spaceBetweenCells : CGFloat = 33
    let numberOfColumns : CGFloat = 1
    
    var typesTableViewCellScreen: TypesTableViewCellScreen = TypesTableViewCellScreen()
    
    static let identifier: String = "TypesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
        typesTableViewCellScreen.configCollectionViewProtocol(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        typesTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typesTableViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            typesTableViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            typesTableViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            typesTableViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            typesTableViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension TypesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = self.frame.width
        let expectUsedSize : CGFloat = (cellDimension * numberOfColumns) + spaceBetweenCells
        let margins = (width - expectUsedSize) / numberOfColumns
        return UIEdgeInsets(top: spaceBetweenCells, left: margins, bottom: spaceBetweenCells, right: margins)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TypesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: TypesCollectionViewCell.identifier, for: indexPath) as? TypesCollectionViewCell
        cell?.setupCell(data: dataType[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 57)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hello")
    }
}

