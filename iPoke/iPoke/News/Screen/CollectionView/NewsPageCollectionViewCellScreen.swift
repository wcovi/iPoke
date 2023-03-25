//
//  NewsPageCollectionViewCellScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 24/03/23.
//

import UIKit

class NewsPageCollectionViewCellScreen: UIView {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var videoNewsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 11
        return image
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
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(timeLabel)
        addSubview(videoNewsImage)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: videoNewsImage.leadingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            dateLabel.heightAnchor.constraint(equalToConstant: 16),
            dateLabel.widthAnchor.constraint(equalToConstant: 70),
            
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 12),
            timeLabel.heightAnchor.constraint(equalToConstant: 16),
            timeLabel.widthAnchor.constraint(equalToConstant: 100),

            videoNewsImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoNewsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            videoNewsImage.heightAnchor.constraint(equalToConstant: 80),
            videoNewsImage.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
