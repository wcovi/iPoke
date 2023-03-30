//
//  HomeViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 06/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeScreen?
    var types = TypesCollectionViewCellScreen()
    
    override func loadView() {
        homeView = HomeScreen()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell( withIdentifier: TypesTableViewCell.identifier, for: indexPath) as? TypesTableViewCell
            cell?.backgroundColor = .clear
            cell?.navigationDelegate(delegate: self)
            return cell ?? UITableViewCell()
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell( withIdentifier: TypesTableViewCell2.identifier, for: indexPath) as? TypesTableViewCell2
            cell?.backgroundColor = .clear
            cell?.navigationDelegate(delegate: self)
            return cell ?? UITableViewCell()
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell( withIdentifier: FamousTableViewCell.identifier, for: indexPath) as? FamousTableViewCell
            cell?.backgroundColor = .clear
            return cell ?? UITableViewCell()
        }
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell
            cell?.backgroundColor = .clear
            cell?.navigationDelegate(delegate: self)
            return cell ?? UITableViewCell()
        }
        
        return UITableViewCell()
        
//        let cell: TypesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: TypesTableViewCell.identifier, for: indexPath) as? TypesTableViewCell
//        cell?.backgroundColor = .clear
//        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 67
        }
        
        if indexPath.row == 1 {
            return 67
        }
        
        if indexPath.row == 2 {
            return 130
        }
        
        if indexPath.row == 3 {
            return 280
        }
        return 0
    }
}

extension HomeViewController: NagivationCustom, NagivationCustom2, NagivationNews {
    func didTapButton(cell: UITableViewCell) {
        let vc = PokedexViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapButton2(cell: UITableViewCell) {
        let vc = PokedexViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapNewsButton(cell: UITableViewCell) {
        let vc = NewsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
