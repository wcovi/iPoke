//
//  FamousCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 07/03/23.
//

import UIKit

protocol FamousCollectionScreenDelegate: AnyObject {
    func tappedButton()
}

class FamousCollectionViewCellScreen: UIView {
    
    weak private var delegate: FamousCollectionScreenDelegate?
    
    public func setUpDelegate(delegate: FamousCollectionScreenDelegate?) {
        self.delegate = delegate
    }

    lazy var famousImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedPokedexButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedPokedexButton() {
        self.delegate?.tappedButton()
    }
    
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
            famousImageButton.topAnchor.constraint(equalTo: topAnchor, constant: -15),
            famousImageButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            famousImageButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            famousImageButton.heightAnchor.constraint(equalToConstant: 85),
            
            titleLabel.topAnchor.constraint(equalTo: famousImageButton.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: famousImageButton.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 85),
        ])
    }
}
