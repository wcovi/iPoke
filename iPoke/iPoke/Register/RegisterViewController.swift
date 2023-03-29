//
//  RegisterViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 28/03/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func backButton(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controler = storyboard.instantiateViewController(withIdentifier: "Main")
        navigationController?.popViewController(animated: true)
        
    }
}
