//
//  TypesTableViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 09/03/23.
//

import UIKit

protocol NagivationCustom: AnyObject {
    func didTapButton(cell: UITableViewCell)
}

class TypesTableViewCell: UITableViewCell {
    
    private weak var navigationCustom: NagivationCustom?
    
    public func navigationDelegate(delegate: NagivationCustom) {
        self.navigationCustom = delegate
    }
    
    var dataType: [Types] = [Types(nameImage: "pokedex"),
                             Types(nameImage: "fireButton"),
                             Types(nameImage: "waterButton"),
                             Types(nameImage: "grassButton"),
                             Types(nameImage: "flyingButton"),
                             Types(nameImage: "fightingButton"),
                             Types(nameImage: "poisonButton"),
                             Types(nameImage: "electricButton"),
                             Types(nameImage: "groundButton"),
                             Types(nameImage: "normalButton"),

    ]
    
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TypesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: TypesCollectionViewCell.identifier, for: indexPath) as? TypesCollectionViewCell
        cell?.setupCell(data: dataType[indexPath.row])
        cell?.typesCollectionViewCellScreen.setUpDelegate(delegate: self)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 57)
    }

}

extension TypesTableViewCell: TypesCollectionScreenDelegate {
    func tappedButton() {
        self.navigationCustom?.didTapButton(cell: self)
    }
}
