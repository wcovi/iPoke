//
//  FamousCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

class FamousCollectionViewCellScreen: UIView {

    lazy var famousImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(famousImageButton)
        addSubview(titleLabel)

    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            famousImageButton.topAnchor.constraint(equalTo: topAnchor),
            famousImageButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            famousImageButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            famousImageButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            famousImageButton.heightAnchor.constraint(equalToConstant: 85),
            famousImageButton.widthAnchor.constraint(equalToConstant: 85),
            
            titleLabel.topAnchor.constraint(equalTo: famousImageButton.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: famousImageButton.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 85)
        ])
    }
}
