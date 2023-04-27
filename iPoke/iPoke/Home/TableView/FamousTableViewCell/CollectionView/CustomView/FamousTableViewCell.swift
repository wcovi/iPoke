//
//  FamousTableViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

protocol NagivationFamousCustom: AnyObject {
    func didTapButtonForGenPokedex(cell: UITableViewCell)
}

class FamousTableViewCell: UITableViewCell {
    
    
    private weak var nagivationFamousCustom: NagivationFamousCustom?

    public func nagivationFamousCustom(delegate: NagivationFamousCustom) {
        self.nagivationFamousCustom = delegate
    }
    
    var dataFamous: [Famous] = [Famous(nameType: "1º Gen", nameImage: "charmanderIcon"),
                                Famous(nameType: "2º Gen", nameImage: "bulbasaurIcon"),
                                Famous(nameType: "3º Gen", nameImage: "pikachuIcon"),
                                Famous(nameType: "4º Gen", nameImage: "squirtleIcon"),
                                Famous(nameType: "5º Gen", nameImage: "charmanderIcon"),
                                Famous(nameType: "6º Gen", nameImage: "bulbasaurIcon"),
                                Famous(nameType: "7º Gen", nameImage: "pikachuIcon"),
                                Famous(nameType: "8º Gen", nameImage: "squirtleIcon"),
                                Famous(nameType: "9º Gen", nameImage: "charmanderIcon"),
    ]
    
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FamousCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: FamousCollectionViewCell.identifier, for: indexPath) as? FamousCollectionViewCell
        cell?.setupCell(data: dataFamous[indexPath.row])
        cell?.famousCollectionViewCellScreen.setUpDelegate(delegate: self)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hello2")
    }
}

extension FamousTableViewCell: FamousCollectionScreenDelegate {
    func tappedButton() {
        self.nagivationFamousCustom?.didTapButtonForGenPokedex(cell: self)
    }
}
