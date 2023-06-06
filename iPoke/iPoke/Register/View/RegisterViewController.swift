//
//  RegisterViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 28/03/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextFieldAgain: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
//    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        validateTextField()
        
    }
    
    func configTextField() {
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextFieldAgain.delegate = self
        
    }
    
    func validateTextField() {
        if nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText && passwordTextFieldAgain.hasText {
            
            if passwordTextField.text == passwordTextFieldAgain.text {
                createAccountButton.isEnabled = true
                
            } else {
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                passwordTextFieldAgain.layer.borderColor = UIColor.red.cgColor
                createAccountButton.isEnabled = false
            }
        } else {
            createAccountButton.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func createAccountButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("Erro durante o cadastro: \(error.localizedDescription)")
                } else {
                    print("Cadastro realizado com sucesso!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
//    func signUp(email: String, password: String, completion: @escaping (Error?) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            completion(error)
//        }
//    }
    
    func openHome() {
        let vc = TabBarController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.hasText {
            textField.layer.borderColor = UIColor.white.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
