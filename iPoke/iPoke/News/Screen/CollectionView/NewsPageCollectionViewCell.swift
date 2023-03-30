//
//  NewsPageCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 24/03/23.
//

import UIKit

class NewsPageCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "NewsPageCollectionViewCell"
    var data: [NewsModel] = []
    
    
    let newsPageCollectionViewCellScreen: NewsPageCollectionViewCellScreen = NewsPageCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
        configBorderCell()
    }
    
    func configBorderCell() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    public func setupCell(data: NewsModel) {
        newsPageCollectionViewCellScreen.nameLabel.text = data.titleVideo
        newsPageCollectionViewCellScreen.dateLabel.text = data.dateVideo
        newsPageCollectionViewCellScreen.timeLabel.text = data.timeVideo
        newsPageCollectionViewCellScreen.videoNewsImage.image = UIImage(named: data.nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        newsPageCollectionViewCellScreen.layer.borderWidth = 1.0
//        newsPageCollectionViewCellScreen.layer.borderColor = UIColor.white.cgColor
        newsPageCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newsPageCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [NewsModel]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            newsPageCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            newsPageCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsPageCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsPageCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
