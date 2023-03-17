//
//  FamousTableViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class FamousTableViewCell: UITableViewCell {

    var dataFamous: [Famous] = [Famous(nameType: "Charmander", nameImage:                                "charmanderIcon"),
                                Famous(nameType: "Bulbasaur", nameImage: "bulbasaurIcon"),
                                Famous(nameType: "Pikachu", nameImage: "pikachuIcon"),
                                Famous(nameType: "Squirtle", nameImage: "squirtleIcon"),
                                Famous(nameType: "Charmander", nameImage: "charmanderIcon"),
                                Famous(nameType: "Bulbasaur", nameImage: "bulbasaurIcon"),
                                Famous(nameType: "Pikachu", nameImage: "pikachuIcon"),
                                Famous(nameType: "Squirtle", nameImage: "squirtleIcon"),
    ]

    let cellDimension : CGFloat = 380
    let spaceBetweenCells : CGFloat = 33
    let numberOfColumns : CGFloat = 1
    
    var famousTableViewCellScreen: FamousTableViewCellScreen = FamousTableViewCellScreen()
    
    static let identifier: String = "FamousTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
        famousTableViewCellScreen.configCollectionViewProtocol(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        famousTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(famousTableViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            famousTableViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            famousTableViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            famousTableViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            famousTableViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension FamousTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFamous.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = self.frame.width
        let expectUsedSize : CGFloat = (cellDimension * numberOfColumns) + spaceBetweenCells
        let margins = (width - expectUsedSize) / numberOfColumns
        return UIEdgeInsets(top: spaceBetweenCells, left: margins, bottom: spaceBetweenCells, right: margins)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FamousCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: FamousCollectionViewCell.identifier, for: indexPath) as? FamousCollectionViewCell
        cell?.setupCell(data: dataFamous[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
}

