//
//  TabBarController.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        self.tabBar.backgroundColor = .white
    }
    
    private func setupTabBarController() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        self.setViewControllers([homeVC, profileVC], animated: false)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["house.fill", "person.fill"]
        
        for x in 0...items.count - 1 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.tintColor = .black
    }
    
}

extension TabBarController: FavoriteViewControllerDelegate {
    func tappedFavoriteButton(data: Pokedex) {
        print("Botão favorito clicado para o item \(data)")
    }
}
