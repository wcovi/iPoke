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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let placeHolderText = NSAttributedString (string: "Yan Alejandro", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        TextFieldName.attributedPlaceholder = placeHolderText
        
        let placeHolderTextEmail = NSAttributedString (string: "yanalejandroios@gmail.com", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        
        TextFieldEmail.attributedPlaceholder = placeHolderTextEmail
        
        let placeHolderTextActuallyPassword = NSAttributedString (string: "*********", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        
        TextFieldUpdatePassword.attributedPlaceholder = placeHolderTextActuallyPassword
        
        let placeHolderTextActuallyPasswordAgain = NSAttributedString (string: "*********", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])

        TextFieldUpdatePasswordAgain.attributedPlaceholder = placeHolderTextActuallyPasswordAgain
        
    }


}
