//
//  LoginViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 06/06/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.setUpDelegate(delegate: self)
        loginScreen?.emailTextField.delegate = self
        loginScreen?.passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        if let email = loginScreen?.emailTextField.text,
           let password = loginScreen?.passwordTextField.text {
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
    
    func tappedRegisterButton() {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let controler = storyboard.instantiateViewController(withIdentifier: "Register")
        navigationController?.pushViewController(controler, animated: true)
    }
    
    func tappedForgetPasswordButton() {
        let storyboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        let controler = storyboard.instantiateViewController(withIdentifier: "ForgotPassword")
        navigationController?.pushViewController(controler, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if !textField.hasText {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        }else {
            textField.layer.borderWidth = 0
        }
        
        if textField.hasText {
            loginScreen?.loginButton.isEnabled = true
        } else {
            loginScreen?.loginButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
