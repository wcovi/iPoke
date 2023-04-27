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
    
    var pokedexViewController: PokedexViewController?
    
    var dataPokedex: [Pokedex] = []
    
    var typesList: [Types] = [Types(typeLabel: "Pokedex", typeButton: "pokedex"),
                              Types(typeLabel: "Fire", typeButton: "fireButton"),
                              Types(typeLabel: "Water", typeButton: "waterButton"),
                              Types(typeLabel: "Grass", typeButton: "grassButton"),
                              Types(typeLabel: "Flying", typeButton: "flyingButton"),
                              Types(typeLabel: "Fighting", typeButton: "fightingButton"),
                              Types(typeLabel: "Poison", typeButton: "poisonButton"),
                              Types(typeLabel: "Electric", typeButton: "electricButton"),
                              Types(typeLabel: "Ground", typeButton: "groundButton"),
                              Types(typeLabel: "Normal", typeButton: "normalButton"),

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
    
//    func didSelectType(_ type: String) {
//        let pokedexVC = PokedexViewController()
//        pokedexVC.selectedType = type
//        navigationController?.pushViewController(pokedexVC, animated: true)
//    }
    
}

extension TypesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TypesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: TypesCollectionViewCell.identifier, for: indexPath) as? TypesCollectionViewCell
        cell?.setupCell(data: typesList[indexPath.row])
        cell?.typesCollectionViewCellScreen.setUpDelegate(delegate: self)
        cell?.pokedexViewController = pokedexViewController
        cell?.didSelectCell()
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = typesList[indexPath.row].typeLabel
        
        let pokedexVC = PokedexViewController()
        pokedexVC.typeFilter = type
    }

}

extension TypesTableViewCell: TypesCollectionScreenDelegate {
    func tappedButton() {
        self.navigationCustom?.didTapButton(cell: self)
    }
}
