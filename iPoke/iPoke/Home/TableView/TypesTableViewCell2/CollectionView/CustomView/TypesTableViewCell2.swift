//
//  TypesTableViewCell2.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

protocol NagivationCustom2: AnyObject {
    func didTapButton2(cell: UITableViewCell)
}

class TypesTableViewCell2: UITableViewCell {
    
    private weak var navigationCustom2: NagivationCustom2?
    
    public func navigationDelegate(delegate: NagivationCustom2) {
        self.navigationCustom2 = delegate
    }
    
    var dataType: [Types] = [Types(typeLabel: "ice", typeButton: "iceButton"),
                             Types(typeLabel: "ghost", typeButton: "ghostButton"),
                             Types(typeLabel: "fairy", typeButton: "fairyButton"),
                             Types(typeLabel: "dark", typeButton: "darkButton"),
                             Types(typeLabel: "dragon", typeButton: "dragonButton"),
                             Types(typeLabel: "steel", typeButton: "steelButton"),
                             Types(typeLabel: "bugButton", typeButton: "bugButton"),
                             Types(typeLabel: "psychic", typeButton: "psychicButton"),
                             Types(typeLabel: "rock", typeButton: "rockButton"),
    ]
    
    var typesTableViewCellScreen2: TypesTableViewCellScreen2 = TypesTableViewCellScreen2()
    
    static let identifier: String = "TypesTableViewCell2"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
        typesTableViewCellScreen2.configCollectionViewProtocol(delegate: self, dataSource: self)
        self.backgroundColor = .clear
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
        cell?.typesCollectionViewCellScreen2.setUpDelegate(delegate: self)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 57)
    }

}

extension TypesTableViewCell2: TypesCollectionScreenDelegate2 {
    func tappedButton() {
        self.navigationCustom2?.didTapButton2(cell: self)
    }
}
