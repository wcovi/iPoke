//
//  BioScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

protocol BioScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedFavoriteButton(data: Pokedex)
}

class BioScreen: UIView {
    
    private weak var delegate: BioScreenDelegate?
    var controller = BioViewController()
    
    public func delegate(delegate: BioScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var fundoBioImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleNamePokeBio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()

    lazy var buttonFavotire: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(goToFavorite), for: .touchUpInside)
        return button
    }()
    
    @objc func goToFavorite() {
        NotificationCenter.default.post(name: Notification.Name("FavoriteButtonTapped"), object: nil)
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBioBackButton), for: .touchUpInside)
        return button
    }()

    @objc func tappedBioBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var pokeballImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.image = UIImage(named: "PokeBolaCompleteWhite")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var informationBioImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 40
        image.image = UIImage(named: "fundoTransparente")
        return image
    }()
    
    lazy var pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var primaryTypeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var secundaryTypeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var bioPokemonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "It spits fire that is hot enough to melt boulders. It may cause forest fires by blowing flames."
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    lazy var statusBioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var bioPokeView: UIView = {
        let view = BioCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var evolutionBioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Evolutions", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.layer.cornerRadius = 15
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0).cgColor
        return button
    }()
    
    lazy var movesBioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Moves", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.layer.cornerRadius = 15
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0).cgColor
        return button
    }()
    
//    lazy var collectionView: UICollectionView = {
//        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.delaysContentTouches = false
//        collection.showsVerticalScrollIndicator = false
//        collection.backgroundColor = .clear
//        collection.register(BioCollectionViewCell.self, forCellWithReuseIdentifier: BioCollectionViewCell.identifier)
//        let layout :UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
//        collection.setCollectionViewLayout(layout, animated: false)
//        return collection
//    }()
//
//    public func configCollectionViewProtocol(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
//        collectionView.delegate = delegate
//        collectionView.dataSource = dataSource
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    func addSubview() {
        addSubview(fundoBioImageView)
        addSubview(titleNamePokeBio)
        addSubview(backButton)
        addSubview(pokeballImage)
        addSubview(informationBioImageView)
        addSubview(pokemonImageView)
        addSubview(primaryTypeImage)
        addSubview(secundaryTypeImage)
        addSubview(bioPokemonLabel)
        addSubview(statusBioButton)
        addSubview(evolutionBioButton)
        addSubview(movesBioButton)
        addSubview(bioPokeView)
        //        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            fundoBioImageView.topAnchor.constraint(equalTo: topAnchor, constant: -50),
            fundoBioImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoBioImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoBioImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleNamePokeBio.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleNamePokeBio.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            pokeballImage.topAnchor.constraint(equalTo: titleNamePokeBio.bottomAnchor, constant: -20),
            pokeballImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokeballImage.heightAnchor.constraint(equalToConstant: 250),
            pokeballImage.widthAnchor.constraint(equalToConstant: 250),
            
//            collectionView.topAnchor.constraint(equalTo: titleNamePokeBio.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            informationBioImageView.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: -75),
            informationBioImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationBioImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            informationBioImageView.heightAnchor.constraint(equalToConstant: 1000),
            
            pokemonImageView.topAnchor.constraint(equalTo: titleNamePokeBio.bottomAnchor, constant: 10),
            pokemonImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            
            primaryTypeImage.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: -5),
            primaryTypeImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -60),
            primaryTypeImage.heightAnchor.constraint(equalToConstant: 40),
            primaryTypeImage.widthAnchor.constraint(equalToConstant: 100),
            
            secundaryTypeImage.centerYAnchor.constraint(equalTo: primaryTypeImage.centerYAnchor),
            secundaryTypeImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60),
            secundaryTypeImage.heightAnchor.constraint(equalToConstant: 40),
            secundaryTypeImage.widthAnchor.constraint(equalToConstant: 100),
            
            bioPokemonLabel.topAnchor.constraint(equalTo: primaryTypeImage.bottomAnchor, constant: 15),
            bioPokemonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            bioPokemonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            bioPokemonLabel.heightAnchor.constraint(equalToConstant: 50),
            
            statusBioButton.topAnchor.constraint(equalTo: bioPokemonLabel.bottomAnchor, constant: 20),
            statusBioButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            statusBioButton.heightAnchor.constraint(equalToConstant: 34),
            statusBioButton.widthAnchor.constraint(equalToConstant: 90),
            
            evolutionBioButton.topAnchor.constraint(equalTo: statusBioButton.topAnchor),
            evolutionBioButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            evolutionBioButton.heightAnchor.constraint(equalToConstant: 34),
            evolutionBioButton.widthAnchor.constraint(equalToConstant: 90),
            
            movesBioButton.topAnchor.constraint(equalTo: statusBioButton.topAnchor),
            movesBioButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            movesBioButton.heightAnchor.constraint(equalToConstant: 34),
            movesBioButton.widthAnchor.constraint(equalToConstant: 90),
            
            bioPokeView.topAnchor.constraint(equalTo: statusBioButton.bottomAnchor, constant: 25),
            bioPokeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            bioPokeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            bioPokeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
        ])
    }
    
}
