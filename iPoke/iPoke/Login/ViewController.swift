//
//  ViewController.swift
//  iPoke
//
//  Created by Wolfgang Florian Covi on 23/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: Any) {
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

