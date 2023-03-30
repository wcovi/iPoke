//
//  BioScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

protocol BioScreenDelegate: AnyObject {
    func tappedBackButton()
}

class BioScreen: UIView {
    
    private weak var delegate: BioScreenDelegate?
    
    public func delegate(delegate: BioScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var fundoBioImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "fundoHome")
        return image
    }()
    
    lazy var titleNamePokeBio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Charizard"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()

    lazy var buttonFavotire: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBioBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBioBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delaysContentTouches = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(BioCollectionViewCell.self, forCellWithReuseIdentifier: BioCollectionViewCell.identifier)
        let layout :UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
    }()
    
    public func configCollectionViewProtocol(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    func addSubview() {
        addSubview(fundoBioImageView)
        addSubview(titleNamePokeBio)
        addSubview(buttonFavotire)
        addSubview(backButton)
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
            
            titleNamePokeBio.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleNamePokeBio.centerXAnchor.constraint(equalTo: centerXAnchor),
            
//            backButton.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            backButton.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            buttonFavotire.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            buttonFavotire.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            buttonFavotire.heightAnchor.constraint(equalToConstant: 24),
            buttonFavotire.widthAnchor.constraint(equalToConstant: 24),
            
            collectionView.topAnchor.constraint(equalTo: titleNamePokeBio.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
    
        ])
    }
    
}
