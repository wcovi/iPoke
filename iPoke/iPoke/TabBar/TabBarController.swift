//
//  TabBarController.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        self.tabBar.backgroundColor = .white
    }
    
    private func setupTabBarController() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let favoriteVC = UINavigationController(rootViewController: FavoriteController())
        let profileVC = UINavigationController(rootViewController: PerfilViewController())
        
        self.setViewControllers([homeVC, favoriteVC, profileVC], animated: false)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["house.fill", "star.fill", "person.fill"]
        
        for x in 0...items.count - 1 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.tintColor = .black
    }
    
}
