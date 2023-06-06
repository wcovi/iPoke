//
//  ProfileViewController.swift
//  iPoke
//
//  Created by Vitor Ernane Guedes on 13/03/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var TextFieldName: UITextField!
    @IBOutlet weak var TextFieldEmail: UITextField!
    @IBOutlet weak var TextFieldUpdatePassword: UITextField!
    @IBOutlet weak var TextFieldUpdatePasswordAgain: UITextField!
    
    @IBOutlet weak var updateInfosButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
        validateTextField()
        
    }
    
    @IBAction func updateInfoProfile(_ sender: UIButton) {
        
        
        let alert: UIAlertController = UIAlertController(title: "Parabéns!", message: "Seus dados foram atualizados com sucesso", preferredStyle: .alert)
        
        let action: UIAlertAction = UIAlertAction(title: "Fechar", style: .default)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func tappedExitButton(_ sender: UIButton) {
        
        let alert: UIAlertController = UIAlertController(title: "Encerrar sessão", message: "você tem certeza que deseja encerrar a sua sessão?", preferredStyle: .actionSheet)
        
        let action: UIAlertAction = UIAlertAction(title: "cancelar", style: .cancel)
        let action2: UIAlertAction = UIAlertAction(title: "sair", style: .destructive)
        { action in
            self.tabBarController?.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(action)
        alert.addAction(action2)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    deinit {
        print("ProfileViewControllerDestroied")
    }
    
    func configTextField () {
        
        TextFieldName.delegate = self
        let placeHolderText = NSAttributedString (string: "Yan Alejandro", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        TextFieldName.attributedPlaceholder = placeHolderText
        
        /* ------------------------------------------------------------------------------------ */
        
        TextFieldEmail.delegate  = self
        let placeHolderTextEmail = NSAttributedString (string: "yanalejandroios@gmail.com", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        
        TextFieldEmail.attributedPlaceholder = placeHolderTextEmail
        
        /* ------------------------------------------------------------------------------------ */
        
        TextFieldUpdatePassword.delegate = self
        let placeHolderTextActuallyPassword = NSAttributedString (string: "*********", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        
        TextFieldUpdatePassword.attributedPlaceholder = placeHolderTextActuallyPassword
        
        /* ------------------------------------------------------------------------------------ */
        
        TextFieldUpdatePasswordAgain.delegate = self
        let placeHolderTextActuallyPasswordAgain = NSAttributedString (string: "*********", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])

        TextFieldUpdatePasswordAgain.attributedPlaceholder = placeHolderTextActuallyPasswordAgain
        
    }
    
    func validateTextField() {
        
        if TextFieldUpdatePassword.hasText && TextFieldUpdatePasswordAgain.hasText {
            
            if TextFieldUpdatePassword.text == TextFieldUpdatePasswordAgain.text {
                updateInfosButton.isEnabled = true
                
            } else {
                TextFieldUpdatePassword.layer.borderColor = UIColor.red.cgColor
                TextFieldUpdatePasswordAgain.layer.borderColor = UIColor.red.cgColor
                updateInfosButton.isEnabled = false
            }
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.hasText {
            textField.layer.borderColor = UIColor.darkGray.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
