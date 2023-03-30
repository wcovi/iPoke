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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hi Yan,"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .white
        return label
    }()
    
    lazy var labelSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Which pokemon would you like to search?"
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
            string: "Pokémons, Types, Movies.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .white
        textField.backgroundColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
        textField.setLeftPaddingViewWithImageInTextfield(padding: 30, imageName: "search")
        textField.layer.cornerRadius = 20
        return textField
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TypesTableViewCell.self, forCellReuseIdentifier: TypesTableViewCell.identifier)
        tableView.register(TypesTableViewCell2.self, forCellReuseIdentifier: TypesTableViewCell2.identifier)
        tableView.register(FamousTableViewCell.self, forCellReuseIdentifier: FamousTableViewCell.identifier)
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return tableView
    }()
    
    lazy var labelSecsion1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Most famous Pokémons"
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
            
            viewFundoHome.topAnchor.constraint(equalTo: topAnchor),
            viewFundoHome.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewFundoHome.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewFundoHome.heightAnchor.constraint(equalToConstant: 300),
            
            fundoHomePokebolaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            fundoHomePokebolaImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            fundoHomePokebolaImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 243),
            fundoHomePokebolaImageView.bottomAnchor.constraint(equalTo: viewFundoHome.bottomAnchor, constant: -143),
            
            imageProfile.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            imageProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            imageProfile.heightAnchor.constraint(equalToConstant: 62),
            imageProfile.widthAnchor.constraint(equalToConstant: 62),
            
            labelNameProfile.centerYAnchor.constraint(equalTo: imageProfile.centerYAnchor),
            labelNameProfile.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 8),
            
            labelSubTitle.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 10),
            labelSubTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            labelSubTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            searchTextField.topAnchor.constraint(equalTo: labelSubTitle.bottomAnchor, constant: 30),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 42),
            
            tableView.topAnchor.constraint(equalTo: viewFundoHome.bottomAnchor, constant: 27),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

//            labelSecsion1.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
//            labelSecsion1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}
