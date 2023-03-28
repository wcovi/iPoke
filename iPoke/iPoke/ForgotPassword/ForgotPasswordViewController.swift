//
//  ForgotPasswordViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 14/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var viewBackgroundImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainLabel: UILabel!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    @IBOutlet weak var refreshPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        

        // Do any additional setup after loading the view.
    }
    
    func configBackgroundImage() {
//        viewBackgroundImage.image = UIImage(named: "Dark Side")
    }

}
