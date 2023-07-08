//
//  NewsCollectionViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "NewsCollectionViewCell"
    var data: [News] = []
    
    let newsCollectionViewCellScreen: NewsCollectionViewCellScreen = NewsCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    public func setupCell(data: News) {
        newsCollectionViewCellScreen.newsImage.setImage(UIImage(named: data.nameImage), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        geracaoCollectionViewCellScreen.layer.borderWidth = 1.0
//        geracaoCollectionViewCellScreen.layer.borderColor = UIColor.white.cgColor
        newsCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newsCollectionViewCellScreen)
    }
    
    public func dataCollection(data: [News]) {
        self.data = data
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            newsCollectionViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            newsCollectionViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsCollectionViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsCollectionViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
