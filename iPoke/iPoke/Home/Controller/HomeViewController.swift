//
//  HomeViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 06/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeScreen?
    
    let cellDimension : CGFloat = 180
    let spaceBetweenCells : CGFloat = 33
    let numberOfColumns : CGFloat = 2
    
    var dataType: [Types] = [Types(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                             Types(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                             Types(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                             Types(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
                             Types(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                             Types(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                             Types(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                             Types(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
    ]
    
    var dataFamous: [Famous] = [Famous(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                                Famous(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                                Famous(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                                Famous(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
                                Famous(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                                Famous(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                                Famous(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                                Famous(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
    ]
    
    var dataHome: [Home] = [Home(nameType: "Fogo", nameImage: "redCard", pokeImage: "pokebola"),
                            Home(nameType: "Elétrico", nameImage: "yellowCard", pokeImage: "pokebola"),
                            Home(nameType: "Grama", nameImage: "greenCard", pokeImage: "pokebola"),
                            Home(nameType: "Água", nameImage: "blueCard", pokeImage: "pokebola"),
    ]
    
    override func loadView() {
        homeView = HomeScreen()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setUpCell(data: dataHome[indexPath.row])
        cell?.backgroundColor = .clear
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }

}

//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataType.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let width = self.view.frame.width
//            let expectUsedSize : CGFloat = (cellDimension * numberOfColumns) + spaceBetweenCells
//            let margins = (width - expectUsedSize) / numberOfColumns
//            return UIEdgeInsets(top: spaceBetweenCells, left: margins, bottom: spaceBetweenCells, right: margins)
//        }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: TypesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: TypesCollectionViewCell.identifier, for: indexPath) as? TypesCollectionViewCell
//        cell?.setupCell(data: dataType[indexPath.row])
//        return cell ?? UICollectionViewCell()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 165, height: 57)
//    }
//}
