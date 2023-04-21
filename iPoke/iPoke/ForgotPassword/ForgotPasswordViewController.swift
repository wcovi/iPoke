//
//  ForgotPasswordViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 14/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var updatePasswordButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
        updatePasswordButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    
    @IBAction func backButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

extension ForgotPasswordViewController: UITextFieldDelegate {
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
        if emailTextField.hasText && newPasswordTextField.hasText && confirmNewPasswordTextField.hasText {
            updatePasswordButton.isEnabled = true
        } else {
            updatePasswordButton.isEnabled = false
        }
    }
    
}

