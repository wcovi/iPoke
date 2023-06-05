//
//  ViewController.swift
//  iPoke
//
//  Created by Wolfgang Florian Covi on 23/01/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
//    lazy var auth = Auth.auth()
    
    @IBOutlet weak var loginButton: UIButton!
    
    private var viewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.isEnabled = false
        configPasswordTextField()
    }
    
    func configPasswordTextField() {
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        let controler = storyboard.instantiateViewController(withIdentifier: "ForgotPassword")
        navigationController?.pushViewController(controler, animated: true)
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print("Erro durante o login: \(error.localizedDescription)")
                    self.showMessage(title: "Erro", message: "Email ou senha incorretos, tente novamente!")
                } else {
                    print("Login realizado com sucesso!")
                    let vc = TabBarController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
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
