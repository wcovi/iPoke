//
//  PokedexScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

protocol PokedexScreenDelegate: AnyObject {
    func tappedBackButton()
}

class PokedexScreen: UIView {
    
    private weak var delegate: PokedexScreenDelegate?
    
    public func delegate(delegate: PokedexScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var fundoBioImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "fundoHome")
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBioBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delaysContentTouches = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(PokedexCollectionViewCell.self, forCellWithReuseIdentifier: PokedexCollectionViewCell.identifier)
        let layout :UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
    }()
    
    public func configCollectionViewProtocol(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    @objc func tappedBioBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var titleNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokédex"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.tintColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    func addSubview() {
        addSubview(fundoBioImageView)
        addSubview(backButton)
        addSubview(titleNameLabel)
        addSubview(filterButton)
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            fundoBioImageView.topAnchor.constraint(equalTo: topAnchor),
            fundoBioImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoBioImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoBioImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: titleNameLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            titleNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            filterButton.centerYAnchor.constraint(equalTo: titleNameLabel.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            filterButton.heightAnchor.constraint(equalToConstant: 24),
            filterButton.widthAnchor.constraint(equalToConstant: 24),
            
            collectionView.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}
