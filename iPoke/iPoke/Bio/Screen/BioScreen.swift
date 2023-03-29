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
    
    lazy var informationBioImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        view.backgroundColor = UIColor(red: 61/255.0, green: 61/255.0, blue: 69/255.0, alpha: 1.0)
        return view
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
    
    lazy var pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "006")
        return image
    }()
    
    lazy var buttonPrimaryType: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fire", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var buttonSecondType: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Flying", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var bioPokemonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Charizard (Japanese: リザードン Lizardon) is a Fire and Flying type Pokémon. He is the evolved form of Charmeleon when he reaches level 36. He is also the final form of Charmander. Unlike its pre-evolutions, it has wings that allow it to fly, it is a pokemon very similar to a dragon."
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
    
    lazy var hpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HP"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var atkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ATK"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var defLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DEF"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var satkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SATK"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var sdefLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SDEF"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var spdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SPD"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var hpValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var atkValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var defValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var satkValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var sdefValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var spdValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    lazy var hpProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .white
        progress.layer.cornerRadius = 8
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.progress = 0.4
        progress.progressTintColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return progress
    }()
    
    lazy var atkProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .white
        progress.layer.cornerRadius = 8
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.progress = 0.8
        progress.progressTintColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return progress
    }()
    
    lazy var defProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .white
        progress.layer.cornerRadius = 8
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.progress = 0.7
        progress.progressTintColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return progress
    }()
    
    lazy var satkProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .white
        progress.layer.cornerRadius = 8
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.progress = 0.9
        progress.progressTintColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return progress
    }()
    
    lazy var sdefProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .white
        progress.layer.cornerRadius = 8
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.progress = 0.5
        progress.progressTintColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return progress
    }()
    
    lazy var spdProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.backgroundColor = .white
        progress.layer.cornerRadius = 8
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.lightGray.cgColor
        progress.progress = 0.7
        progress.progressTintColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
        return progress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    func addSubview() {
        addSubview(fundoBioImageView)
        addSubview(informationBioImageView)
        addSubview(titleNamePokeBio)
        addSubview(buttonFavotire)
        addSubview(backButton)
        addSubview(pokemonImageView)
        addSubview(buttonPrimaryType)
        addSubview(buttonSecondType)
        addSubview(bioPokemonLabel)
        addSubview(statusBioButton)
        addSubview(evolutionBioButton)
        addSubview(movesBioButton)
        addSubview(hpLabel)
        addSubview(atkLabel)
        addSubview(defLabel)
        addSubview(satkLabel)
        addSubview(sdefLabel)
        addSubview(spdLabel)
        addSubview(hpValueLabel)
        addSubview(atkValueLabel)
        addSubview(defValueLabel)
        addSubview(satkValueLabel)
        addSubview(sdefValueLabel)
        addSubview(spdValueLabel)
        addSubview(hpProgressView)
        addSubview(atkProgressView)
        addSubview(defProgressView)
        addSubview(satkProgressView)
        addSubview(sdefProgressView)
        addSubview(spdProgressView)
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
            
            informationBioImageView.topAnchor.constraint(equalTo: topAnchor, constant: 280),
            informationBioImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationBioImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            informationBioImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleNamePokeBio.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleNamePokeBio.centerXAnchor.constraint(equalTo: centerXAnchor),
            
//            backButton.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            backButton.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            buttonFavotire.centerYAnchor.constraint(equalTo: titleNamePokeBio.centerYAnchor),
            buttonFavotire.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            buttonFavotire.heightAnchor.constraint(equalToConstant: 24),
            buttonFavotire.widthAnchor.constraint(equalToConstant: 24),
            
            pokemonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            pokemonImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 250),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 250),
            
            buttonPrimaryType.topAnchor.constraint(equalTo: informationBioImageView.topAnchor, constant: 50),
            buttonPrimaryType.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -60),
            buttonPrimaryType.heightAnchor.constraint(equalToConstant: 34),
            buttonPrimaryType.widthAnchor.constraint(equalToConstant: 90),
            
            buttonSecondType.topAnchor.constraint(equalTo: informationBioImageView.topAnchor, constant: 50),
            buttonSecondType.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60),
            buttonSecondType.heightAnchor.constraint(equalToConstant: 34),
            buttonSecondType.widthAnchor.constraint(equalToConstant: 90),
            
            bioPokemonLabel.topAnchor.constraint(equalTo: buttonPrimaryType.bottomAnchor, constant: 24),
            bioPokemonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            bioPokemonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            bioPokemonLabel.heightAnchor.constraint(equalToConstant: 113),
            
            statusBioButton.topAnchor.constraint(equalTo: bioPokemonLabel.bottomAnchor, constant: 40),
            statusBioButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            statusBioButton.heightAnchor.constraint(equalToConstant: 34),
            statusBioButton.widthAnchor.constraint(equalToConstant: 90),
            
            evolutionBioButton.topAnchor.constraint(equalTo: bioPokemonLabel.bottomAnchor, constant: 40),
            evolutionBioButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            evolutionBioButton.heightAnchor.constraint(equalToConstant: 34),
            evolutionBioButton.widthAnchor.constraint(equalToConstant: 90),
            
            movesBioButton.topAnchor.constraint(equalTo: bioPokemonLabel.bottomAnchor, constant: 40),
            movesBioButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            movesBioButton.heightAnchor.constraint(equalToConstant: 34),
            movesBioButton.widthAnchor.constraint(equalToConstant: 90),
            
            hpLabel.topAnchor.constraint(equalTo: statusBioButton.bottomAnchor, constant: 25),
            hpLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            hpLabel.widthAnchor.constraint(equalToConstant: 38),
            hpLabel.heightAnchor.constraint(equalToConstant: 16),
            
            atkLabel.topAnchor.constraint(equalTo: hpLabel.bottomAnchor, constant: 10),
            atkLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            atkLabel.widthAnchor.constraint(equalToConstant: 38),
            atkLabel.heightAnchor.constraint(equalToConstant: 16),
            
            defLabel.topAnchor.constraint(equalTo: atkLabel.bottomAnchor, constant: 10),
            defLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            defLabel.widthAnchor.constraint(equalToConstant: 38),
            defLabel.heightAnchor.constraint(equalToConstant: 16),
            
            satkLabel.topAnchor.constraint(equalTo: defLabel.bottomAnchor, constant: 10),
            satkLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            satkLabel.widthAnchor.constraint(equalToConstant: 38),
            satkLabel.heightAnchor.constraint(equalToConstant: 16),
            
            sdefLabel.topAnchor.constraint(equalTo: satkLabel.bottomAnchor, constant: 10),
            sdefLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            sdefLabel.widthAnchor.constraint(equalToConstant: 38),
            sdefLabel.heightAnchor.constraint(equalToConstant: 16),
            
            spdLabel.topAnchor.constraint(equalTo: sdefLabel.bottomAnchor, constant: 10),
            spdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            spdLabel.widthAnchor.constraint(equalToConstant: 38),
            spdLabel.heightAnchor.constraint(equalToConstant: 16),
            
            hpValueLabel.topAnchor.constraint(equalTo: statusBioButton.bottomAnchor, constant: 25),
            hpValueLabel.leadingAnchor.constraint(equalTo: hpLabel.trailingAnchor, constant: 9),
            hpValueLabel.widthAnchor.constraint(equalToConstant: 30),
            hpValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            atkValueLabel.topAnchor.constraint(equalTo: hpValueLabel.bottomAnchor, constant: 10),
            atkValueLabel.leadingAnchor.constraint(equalTo: atkLabel.trailingAnchor, constant: 9),
            atkValueLabel.widthAnchor.constraint(equalToConstant: 30),
            atkValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            defValueLabel.topAnchor.constraint(equalTo: atkValueLabel.bottomAnchor, constant: 10),
            defValueLabel.leadingAnchor.constraint(equalTo: defLabel.trailingAnchor, constant: 9),
            defValueLabel.widthAnchor.constraint(equalToConstant: 30),
            defValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            satkValueLabel.topAnchor.constraint(equalTo: defValueLabel.bottomAnchor, constant: 10),
            satkValueLabel.leadingAnchor.constraint(equalTo: satkLabel.trailingAnchor, constant: 9),
            satkValueLabel.widthAnchor.constraint(equalToConstant: 30),
            satkValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            sdefValueLabel.topAnchor.constraint(equalTo: satkValueLabel.bottomAnchor, constant: 10),
            sdefValueLabel.leadingAnchor.constraint(equalTo: sdefLabel.trailingAnchor, constant: 9),
            sdefValueLabel.widthAnchor.constraint(equalToConstant: 30),
            sdefValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            spdValueLabel.topAnchor.constraint(equalTo: sdefValueLabel.bottomAnchor, constant: 10),
            spdValueLabel.leadingAnchor.constraint(equalTo: spdLabel.trailingAnchor, constant: 9),
            spdValueLabel.widthAnchor.constraint(equalToConstant: 30),
            spdValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            hpProgressView.topAnchor.constraint(equalTo: statusBioButton.bottomAnchor, constant: 25),
            hpProgressView.leadingAnchor.constraint(equalTo: hpValueLabel.trailingAnchor, constant: 12),
            hpProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            hpProgressView.heightAnchor.constraint(equalToConstant: 16),
            
            atkProgressView.topAnchor.constraint(equalTo: hpProgressView.bottomAnchor, constant: 10),
            atkProgressView.leadingAnchor.constraint(equalTo: hpValueLabel.trailingAnchor, constant: 12),
            atkProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            atkProgressView.heightAnchor.constraint(equalToConstant: 16),
            
            defProgressView.topAnchor.constraint(equalTo: atkProgressView.bottomAnchor, constant: 10),
            defProgressView.leadingAnchor.constraint(equalTo: hpValueLabel.trailingAnchor, constant: 12),
            defProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            defProgressView.heightAnchor.constraint(equalToConstant: 16),
            
            satkProgressView.topAnchor.constraint(equalTo: defProgressView.bottomAnchor, constant: 10),
            satkProgressView.leadingAnchor.constraint(equalTo: hpValueLabel.trailingAnchor, constant: 12),
            satkProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            satkProgressView.heightAnchor.constraint(equalToConstant: 16),
            
            sdefProgressView.topAnchor.constraint(equalTo: satkProgressView.bottomAnchor, constant: 10),
            sdefProgressView.leadingAnchor.constraint(equalTo: hpValueLabel.trailingAnchor, constant: 12),
            sdefProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            sdefProgressView.heightAnchor.constraint(equalToConstant: 16),
            
            spdProgressView.topAnchor.constraint(equalTo: sdefProgressView.bottomAnchor, constant: 10),
            spdProgressView.leadingAnchor.constraint(equalTo: hpValueLabel.trailingAnchor, constant: 12),
            spdProgressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            spdProgressView.heightAnchor.constraint(equalToConstant: 16),
            
        ])
    }
    
}
