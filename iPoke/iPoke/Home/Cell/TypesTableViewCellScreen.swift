//
//  TypesTableViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 09/03/23.
//

import UIKit

class TypesTableViewCellScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout:
                                                UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints=false
        collection.showsHorizontalScrollIndicator=false
        collection.backgroundColor = .white
        collection.delaysContentTouches = false
        let layout :UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(collectionView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
