//
//  ForgotPasswordScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 26/06/23.
//

import UIKit

protocol ForgotPasswordScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedRegisterButton()
}

class ForgotPasswordScreen: UIView {
    
    private weak var delegate: ForgotPasswordScreenDelegate?
    
    public func delegate(delegate: ForgotPasswordScreenDelegate?) {
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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forgot your password"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type your email, insert new password and then the app will update it."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
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
    
    lazy var updatePasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Password", for: .normal)
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
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(updatePasswordButton)
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
            
            titleLabel.topAnchor.constraint(equalTo: fundoWhiteView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            emailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            updatePasswordButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            updatePasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            updatePasswordButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            updatePasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            updatePasswordButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
