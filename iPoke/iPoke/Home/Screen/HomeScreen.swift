//
//  HomeScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 06/03/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var fundoHomeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "fundoHome")
        return image
    }()
    
    lazy var fundoHomePokebolaImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pokeBolaComplete")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var viewFundoHome: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "home")
        return image
    }()
    
    lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "photoProfile")
        return image
    }()
    
    lazy var labelNameProfile: UILabel = {
        let label = UILabel()
        label.text = "Olá Yan,"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .white
        return label
    }()
    
    lazy var labelSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Qual pokémon você gostaria de pesquisar?"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "Pokémon, Tipos, etc.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .white
        textField.backgroundColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
        textField.setLeftPaddingViewWithImageInTextfield(padding: 30, imageName: "search")
        textField.layer.cornerRadius = 20
        return textField
    }()
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .clear
////        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
////        tableView.register(TypesTableViewCell.self, forCellReuseIdentifier: TypesTableViewCell.identifier)
//        return tableView
//    }()
    
//    lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.delaysContentTouches = false
//        collectionView.backgroundColor = .clear
//        collectionView.register(TypesCollectionViewCell.self, forCellWithReuseIdentifier: TypesCollectionViewCell.identifier)
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .horizontal
//        collectionView.setCollectionViewLayout(layout, animated: false)
//        return collectionView
//    }()
    
//    lazy var collectionView2: UICollectionView = {
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.delaysContentTouches = false
//        collectionView.backgroundColor = .clear
//        collectionView.register(FamousCollectionViewCell.self, forCellWithReuseIdentifier: FamousCollectionViewCell.identifier)
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .horizontal
//        collectionView.setCollectionViewLayout(layout, animated: false)
//        return collectionView
//    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
    }()
    
    lazy var labelSecsion1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokémons mais famosos"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()

    }
    
    
    func addSubview() {
        configBackground()
//        layoutSubviews()
        addSubview(fundoHomeImageView)
        addSubview(viewFundoHome)
        addSubview(fundoHomePokebolaImageView)
        addSubview(imageProfile)
        addSubview(labelNameProfile)
        addSubview(labelSubTitle)
        addSubview(searchTextField)
        addSubview(tableView)
//        addSubview(labelSecsion1)
        setUpConstraints()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func configBackground() {
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            fundoHomeImageView.topAnchor.constraint(equalTo: topAnchor),
            fundoHomeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoHomeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoHomeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            viewFundoHome.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            viewFundoHome.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            viewFundoHome.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            viewFundoHome.heightAnchor.constraint(equalToConstant: 342),
            
            fundoHomePokebolaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            fundoHomePokebolaImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            fundoHomePokebolaImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 243),
            fundoHomePokebolaImageView.bottomAnchor.constraint(equalTo: viewFundoHome.bottomAnchor, constant: -143),
            
            imageProfile.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            imageProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            imageProfile.heightAnchor.constraint(equalToConstant: 62),
            imageProfile.widthAnchor.constraint(equalToConstant: 62),
            
            labelNameProfile.topAnchor.constraint(equalTo: topAnchor, constant: 128),
            labelNameProfile.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 8),
            
            labelSubTitle.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 30),
            labelSubTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            labelSubTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            searchTextField.topAnchor.constraint(equalTo: labelSubTitle.bottomAnchor, constant: 30),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 42),
            
            tableView.topAnchor.constraint(equalTo: viewFundoHome.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
//            collectionView.topAnchor.constraint(equalTo: viewFundoHome.bottomAnchor, constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 190),

//            labelSecsion1.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
//            labelSecsion1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}
