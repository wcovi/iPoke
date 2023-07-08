//
//  ProfileViewController.swift
//  iPoke
//
//  Created by Yan Alejandro on 26/06/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    var profileScreen: ProfileScreen?
    
    override func loadView() {
        profileScreen = ProfileScreen()
        view = profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileScreen?.delegate(delegate: self)
        configTextField()
        validateTextField()
        configGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true) // Sair do modo de edição do UITextField
    }
    
    func configTextField() {
        profileScreen?.nameTextField.delegate = self
        profileScreen?.emailTextField.delegate = self
        profileScreen?.passwordTextField.delegate = self
        profileScreen?.confirmPasswordTextField.delegate = self
    }
    
    func validateTextField() {
        if ((profileScreen?.nameTextField.hasText) == true) && ((profileScreen?.emailTextField.hasText) == true) && ((profileScreen?.passwordTextField.hasText) == true) && ((profileScreen?.confirmPasswordTextField.hasText) == true) {
            
            if profileScreen?.passwordTextField.text == profileScreen?.confirmPasswordTextField.text {
                profileScreen?.upadateButton.isEnabled = true
            } else {
                profileScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                profileScreen?.confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                profileScreen?.upadateButton.isEnabled = false
            }
        } else {
            profileScreen?.upadateButton.isEnabled = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileScreen?.profileImageView.layer.cornerRadius = (profileScreen?.profileImageView.frame.size.width ?? 0) / 2
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension ProfileViewController: ProfileScreenDelegate {
    
    func updateProfile() {
        let alert: UIAlertController = UIAlertController(title: "Parabéns!", message: "Seus dados foram atualizados com sucesso", preferredStyle: .alert)
        
        let action: UIAlertAction = UIAlertAction(title: "Fechar", style: .default)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func exitProfile() {
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
    
    func openGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            profileScreen?.profileImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
        switch textField {
        case profileScreen?.nameTextField:
            profileScreen?.emailTextField.becomeFirstResponder()
        case profileScreen?.emailTextField:
            profileScreen?.passwordTextField.becomeFirstResponder()
        case profileScreen?.passwordTextField:
            profileScreen?.confirmPasswordTextField.becomeFirstResponder()
        case profileScreen?.confirmPasswordTextField:
            profileScreen?.confirmPasswordTextField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
}
