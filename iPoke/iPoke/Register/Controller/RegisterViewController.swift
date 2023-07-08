//
//  RegisterViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 28/03/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
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
        registerScreen?.nameTextField.delegate = self
        registerScreen?.emailTextField.delegate = self
        registerScreen?.passwordTextField.delegate = self
        registerScreen?.confirmPasswordTextField.delegate = self
    }
    
    func validateTextField() {
        if ((registerScreen?.nameTextField.hasText) == true) && ((registerScreen?.emailTextField.hasText) == true) && ((registerScreen?.passwordTextField.hasText) == true) && ((registerScreen?.confirmPasswordTextField.hasText) == true) {
            
            if registerScreen?.passwordTextField.text == registerScreen?.confirmPasswordTextField.text {
                registerScreen?.createAccountButton.isEnabled = true
            } else {
                registerScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                registerScreen?.confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                registerScreen?.createAccountButton.isEnabled = false
            }
        } else {
            registerScreen?.createAccountButton.isEnabled = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        registerScreen?.profileImageView.layer.cornerRadius = (registerScreen?.profileImageView.frame.size.width ?? 0) / 2
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension RegisterViewController: RegisterScreenDelegate {
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        if let email = registerScreen?.emailTextField.text, let password = registerScreen?.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    self.showMessage(title: "Erro", message:(String(describing: error.localizedDescription)))
                    print("Erro durante o cadastro: \(error.localizedDescription)")
                } else {
                    print("Cadastro realizado com sucesso!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func openGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            registerScreen?.profileImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
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
        
        if textField == registerScreen?.confirmPasswordTextField {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case registerScreen?.nameTextField:
            registerScreen?.emailTextField.becomeFirstResponder()
        case registerScreen?.emailTextField:
            registerScreen?.passwordTextField.becomeFirstResponder()
        case registerScreen?.passwordTextField:
            registerScreen?.confirmPasswordTextField.becomeFirstResponder()
        case registerScreen?.confirmPasswordTextField:
            registerScreen?.confirmPasswordTextField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
}
