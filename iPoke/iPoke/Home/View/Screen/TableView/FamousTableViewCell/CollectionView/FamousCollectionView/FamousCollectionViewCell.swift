//
//  FamousCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

class FamousCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FamousCollectionViewCell"
    var data: [Famous] = []
    
    let famousCollectionViewCellScreen: FamousCollectionViewCellScreen = FamousCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: Famous) {
        famousCollectionViewCellScreen.famousImageButton.setImage(UIImage(named: data.nameImage), for: .normal)
        famousCollectionViewCellScreen.titleLabel.text = data.nameType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        geracaoCollectionViewCellScreen.layer.borderWidth = 1.0
//        geracaoCollectionViewCellScreen.layer.borderColor = UIColor.white.cgColor
        famousCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(famousCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [Famous]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            famousCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            famousCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            famousCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            famousCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
