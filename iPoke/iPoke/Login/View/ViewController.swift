//
//  ViewController.swift
//  iPoke
//
//  Created by Wolfgang Florian Covi on 23/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.isEnabled = false
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
    
    @IBAction func registerButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let controler = storyboard.instantiateViewController(withIdentifier: "Register")
        navigationController?.pushViewController(controler, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.hasText == false {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
        if emailTextField.hasText && passwordTextField.hasText {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
