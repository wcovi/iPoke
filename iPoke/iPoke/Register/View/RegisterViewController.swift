//
//  RegisterViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 28/03/23.
//

import UIKit

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
//        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if let error = error {
//                // Lidar com erros durante a criação da conta
//                print("Erro ao criar a conta: \(error.localizedDescription)")
//                return
//            }
            
            // Conta criada com sucesso, você pode fazer algo aqui
//            print("Conta criada com sucesso!")
            
            let alert = UIAlertController(title: "Parabéns!", message: "Seu cadastro foi realizado com sucesso", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ir para a Home", style: .default) { [weak self] (_) in
                guard let self = self else { return }
                
                let vc = TabBarController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
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
