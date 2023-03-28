//
//  ViewController.swift
//  iPoke
//
//  Created by Wolfgang Florian Covi on 23/01/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        let controler = storyboard.instantiateViewController(withIdentifier: "ForgotPassword")
        navigationController?.pushViewController(controler, animated: true)
                                      
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

