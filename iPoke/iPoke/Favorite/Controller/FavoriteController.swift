//
//  FavoriteController.swift
//  iPoke
//
//  Created by Yan Alejandro on 16/03/23.
//

import UIKit

class FavoriteController: UIViewController {
    
    var favoriteView: FavoriteScreen?
    
    override func loadView() {
        favoriteView = FavoriteScreen()
        view = favoriteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
