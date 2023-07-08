//
//  ProfileScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 26/06/23.
//

import UIKit

protocol ProfileScreenDelegate: AnyObject {
    func openGallery()
    func updateProfile()
    func exitProfile()
}

class ProfileScreen: UIView {
    
    private weak var delegate: ProfileScreenDelegate?
    
    public func delegate(delegate: ProfileScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var titleProfileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var fundoDarkView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Dark Side")
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
    
    lazy var upadateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update", for: .normal)
        button.setTitleColor(UIColor(red: 49/255.0, green: 53/255.0, blue: 69/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(tappedUpdateProfileButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedUpdateProfileButton() {
        delegate?.updateProfile()
    }
    
    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 255/255.0, green: 59/255.0, blue: 48/255.0, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedExitProfileButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedExitProfileButton() {
        delegate?.exitProfile()
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
        addSubview(titleProfileLabel)
        addSubview(profileImageView)
        addSubview(openGalleryButton)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(upadateButton)
        addSubview(exitButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            fundoDarkView.topAnchor.constraint(equalTo: topAnchor),
            fundoDarkView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoDarkView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoDarkView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleProfileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleProfileLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleProfileLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleProfileLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            titleProfileLabel.heightAnchor.constraint(equalToConstant: 15),
            
            profileImageView.topAnchor.constraint(equalTo: centerYAnchor, constant: -300),
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
            
            upadateButton.bottomAnchor.constraint(equalTo: exitButton.topAnchor, constant: -20),
            upadateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            upadateButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            upadateButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            upadateButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            exitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            exitButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
