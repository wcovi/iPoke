//
//  NewsScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 24/03/23.
//

import UIKit

protocol NewsScreenDelegate: AnyObject {
    func tappedBackButton()
}

class NewsScreen: UIView {
    
    private weak var delegate: NewsScreenDelegate?
    
    public func delegate(delegate: NewsScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var fundoNewsImageView: UIImageView = {
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
        button.addTarget(self, action: #selector(tappedNewsBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedNewsBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var titleNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delaysContentTouches = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(NewsPageCollectionViewCell.self, forCellWithReuseIdentifier: NewsPageCollectionViewCell.identifier)
        let layout :UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
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
        addSubview(fundoNewsImageView)
        addSubview(backButton)
        addSubview(titleNameLabel)
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            fundoNewsImageView.topAnchor.constraint(equalTo: topAnchor),
            fundoNewsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoNewsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoNewsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: titleNameLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            titleNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            titleNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
