//
//  ForgotPasswordViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 26/06/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var forgotPasswordScreen: ForgotPasswordScreen?
    
    override func loadView() {
        forgotPasswordScreen = ForgotPasswordScreen()
        view = forgotPasswordScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordScreen?.delegate(delegate: self)
        configTextField()
        validateTextField()
        configGesture()
    }
    
    func configGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true) // Sair do modo de edição do UITextField
    }
    
    func configTextField() {
        forgotPasswordScreen?.emailTextField.delegate = self
        forgotPasswordScreen?.passwordTextField.delegate = self
        forgotPasswordScreen?.confirmPasswordTextField.delegate = self
    }
    
    func validateTextField() {
        if ((forgotPasswordScreen?.emailTextField.hasText) == true) && ((forgotPasswordScreen?.passwordTextField.hasText) == true) && ((forgotPasswordScreen?.confirmPasswordTextField.hasText) == true) {
            
            if forgotPasswordScreen?.passwordTextField.text == forgotPasswordScreen?.confirmPasswordTextField.text {
                forgotPasswordScreen?.updatePasswordButton.isEnabled = true
            } else {
                forgotPasswordScreen?.updatePasswordButton.layer.borderColor = UIColor.red.cgColor
                forgotPasswordScreen?.confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                forgotPasswordScreen?.updatePasswordButton.isEnabled = false
            }
        } else {
            forgotPasswordScreen?.updatePasswordButton.isEnabled = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension ForgotPasswordViewController: ForgotPasswordScreenDelegate {
    
    func tappedRegisterButton() {
        print("Senha atualizada com sucesso")
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        validateTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.hasText {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0).cgColor
        } else {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        }
        validateTextField()
        
        if textField == forgotPasswordScreen?.confirmPasswordTextField {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case forgotPasswordScreen?.emailTextField:
            forgotPasswordScreen?.passwordTextField.becomeFirstResponder()
            
        case forgotPasswordScreen?.passwordTextField:
            forgotPasswordScreen?.confirmPasswordTextField.becomeFirstResponder()
            
        default:
            break
        }
        
        return true
    }
}
