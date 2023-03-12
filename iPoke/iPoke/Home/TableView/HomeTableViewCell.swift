//
//  HomeTableViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 09/03/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier: String = "HomeTableViewCell"
    
    lazy var homeTableViewScreen: HomeTableViewScreen = {
        let view = HomeTableViewScreen()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        contentView.addSubview(homeTableViewScreen)
    }
    
    public func setUpCell(data: Home) {
        homeTableViewScreen.boxImageTypePokemon.image = UIImage(named: data.nameImage)
        homeTableViewScreen.typeLabel.text = data.nameType
        homeTableViewScreen.pokebolaImage.image = UIImage(named: data.pokeImage)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            homeTableViewScreen.topAnchor.constraint(equalTo: topAnchor),
            homeTableViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeTableViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
