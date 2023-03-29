//
//  NewsTableViewCell.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

protocol NagivationNews: AnyObject {
    func didTapNewsButton(cell: UITableViewCell)
}

class NewsTableViewCell: UITableViewCell {
    
    private weak var navigationNews: NagivationNews?
    
    public func navigationDelegate(delegate: NagivationNews) {
        self.navigationNews = delegate
    }

    var dataNews: [News] = [News(nameImage: "news1"),
                            News(nameImage: "news2"),
                            News(nameImage: "news1"),
                            News(nameImage: "news2"),
                            News(nameImage: "news1"),
                            News(nameImage: "news2")]
    
    var newsTableViewCellScreen: NewsTableViewCellScreen = NewsTableViewCellScreen()
    
    static let identifier: String = "NewsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configConstraints()
        newsTableViewCellScreen.configCollectionViewProtocol(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        newsTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newsTableViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            newsTableViewCellScreen.topAnchor.constraint(equalTo: topAnchor),
            newsTableViewCellScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsTableViewCellScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsTableViewCellScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension NewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NewsCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as? NewsCollectionViewCell
        cell?.setupCell(data: dataNews[indexPath.row])
        cell?.newsCollectionViewCellScreen.setUpDelegate(delegate: self)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width * 0.355, height: 200)
    }

}

extension NewsTableViewCell: NewsCollectionScreenDelegate {
    func tappedButton() {
        self.navigationNews?.didTapNewsButton(cell: self)
    }
}
