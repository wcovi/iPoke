//
//  BioViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 21/03/23.
//

import UIKit

class BioViewController: UIViewController {
    
    var bioScreen: BioScreen?
    
    override func loadView() {
        bioScreen = BioScreen()
        view = bioScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        bioScreen?.delegate(delegate: self)
    }
}


extension BioViewController: BioScreenDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

