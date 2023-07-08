//
//  RegisterScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 24/06/23.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedRegisterButton()
    func openGallery()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenDelegate?
    
    public func delegate(delegate: RegisterScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var fundoDarkView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Dark Side")
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedScreenBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedScreenBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var logoInDarkView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LogoEstatica 1")
        return image
    }()
    
    lazy var fundoWhiteView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bgForgetPassword")
        return image
    }()
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "eu")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var openGalleryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "openGallery"), for: .normal)
        button.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        return button
    }()
    
    @objc func openGallery() {
        delegate?.openGallery()
    }
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "Type your name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        textField.setLeftPaddingViewWithImageInTextfield(padding: 30, imageName: "person.fill")
        textField.tintColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0).cgColor
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "Type your email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        textField.setLeftPaddingViewWithImageInTextfield(padding: 30, imageName: "envelope.fill")
        textField.tintColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0).cgColor
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "Type your password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        textField.setLeftPaddingViewWithImageInTextfield(padding: 30, imageName: "lock.fill")
        textField.tintColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0).cgColor
        return textField
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(
            string: "Confirm your password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        textField.setLeftPaddingViewWithImageInTextfield(padding: 30, imageName: "lock.fill")
        textField.tintColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0).cgColor
        return textField
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 49/255.0, green: 53/255.0, blue: 69/255.0, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedScreenRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedScreenRegisterButton() {
        delegate?.tappedRegisterButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(fundoDarkView)
        addSubview(backButton)
        addSubview(logoInDarkView)
        addSubview(fundoWhiteView)
        addSubview(profileImageView)
        addSubview(openGalleryButton)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(createAccountButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            fundoDarkView.topAnchor.constraint(equalTo: topAnchor),
            fundoDarkView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoDarkView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoDarkView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            logoInDarkView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            logoInDarkView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoInDarkView.widthAnchor.constraint(equalToConstant: 115),
            logoInDarkView.heightAnchor.constraint(equalToConstant: 57),
            
            fundoWhiteView.topAnchor.constraint(equalTo: centerYAnchor, constant: -220),
            fundoWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoWhiteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: fundoWhiteView.topAnchor, constant: 25),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 130),
            profileImageView.widthAnchor.constraint(equalToConstant: 130),
            
            openGalleryButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            openGalleryButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            openGalleryButton.widthAnchor.constraint(equalToConstant: 40),
            openGalleryButton.heightAnchor.constraint(equalToConstant: 40),
            
            nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            createAccountButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createAccountButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
