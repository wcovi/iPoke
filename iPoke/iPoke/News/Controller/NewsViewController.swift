//
//  NewsViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 24/03/23.
//

import UIKit

class NewsViewController: UIViewController {

    var newsScreen: NewsScreen?
    
    var dataNews: [NewsModel] = [NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022",                                      timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022",                                      timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
                                 NewsModel(titleVideo: "Pikachu Over", dateVideo: "15/05/2022", timeVideo: "2m47s", nameImage: "news"),
    ]
    
    override func loadView() {
        newsScreen = NewsScreen()
        view = newsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsScreen?.delegate(delegate: self)
        newsScreen?.configCollectionViewProtocol(delegate: self, dataSource: self)

    }
    
}

extension NewsViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: NewsPageCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: NewsPageCollectionViewCell.identifier, for: indexPath) as? NewsPageCollectionViewCell
        cell?.setupCell(data: dataNews[indexPath.row])
        cell?.layer.borderWidth = 2
        cell?.layer.borderColor = UIColor.white.cgColor
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

extension NewsViewController: NewsScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
