//
//  NewsCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

protocol NewsCollectionScreenDelegate: AnyObject {
    func tappedButton()
}

class NewsCollectionViewCellScreen: UIView {
    
    weak private var delegate: NewsCollectionScreenDelegate?
    
    public func setUpDelegate(delegate: NewsCollectionScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var newsImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedNewsButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedNewsButton() {
        self.delegate?.tappedButton()
    }
    
    func addSubview() {
        addSubview(newsImage)

    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 210),
            newsImage.widthAnchor.constraint(equalToConstant: 158),
            
        ])
    }
}
