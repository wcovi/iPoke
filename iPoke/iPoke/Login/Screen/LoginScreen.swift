//
//  LoginScreen.swift
//  iPoke
//
//  Created by Yan Alejandro on 06/06/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
    func tappedForgetPasswordButton()
}

class LoginScreen: UIView {
    
    weak private var delegate: LoginScreenProtocol?
    
    public func setUpDelegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var fundoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundLogin")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LogoEstatica 1")
        image.contentMode = .scaleAspectFill
        return image
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
        textField.autocapitalizationType = .none
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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var saveEmailSwitch: UISwitch = {
        let saveSwitch = UISwitch()
        saveSwitch.translatesAutoresizingMaskIntoConstraints = false
        saveSwitch.isOn = true
        saveSwitch.onTintColor = UIColor(red: 56/255.0, green: 106/255.0, blue: 187/255.0, alpha: 1.0)
        return saveSwitch
    }()
    
    lazy var subtitleSaveEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remember my email"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 56/255.0, green: 106/255.0, blue: 187/255.0, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton() {
        self.delegate?.tappedLoginButton()
    }
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forget Password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(tappedForgetPasswordButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedForgetPasswordButton() {
        self.delegate?.tappedForgetPasswordButton()
    }
    
    lazy var viewForAccountImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Rectangle 2")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var appleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Apple"), for: .normal)
        return button
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Google"), for: .normal)
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Facebook"), for: .normal)
        return button
    }()
    
    lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No account?"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var createHereButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Here", for: .normal)
        button.setTitleColor(UIColor(red: 56/255.0, green: 106/255.0, blue: 187/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton() {
        self.delegate?.tappedRegisterButton()
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
        addSubview(fundoImageView)
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(forgetPasswordButton)
        addSubview(viewForAccountImageView)
        addSubview(appleButton)
        addSubview(googleButton)
        addSubview(facebookButton)
        addSubview(noAccountLabel)
        addSubview(createHereButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            fundoImageView.topAnchor.constraint(equalTo: topAnchor),
            fundoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -230),
            
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
//            loginButton.widthAnchor.constraint(equalToConstant: 200),
            
            forgetPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            forgetPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            forgetPasswordButton.heightAnchor.constraint(equalToConstant: 40),
            forgetPasswordButton.widthAnchor.constraint(equalToConstant: 130),
            
            viewForAccountImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewForAccountImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewForAccountImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewForAccountImageView.heightAnchor.constraint(equalToConstant: 150),
            
            appleButton.topAnchor.constraint(equalTo: viewForAccountImageView.topAnchor, constant: 30),
            appleButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -70),
            appleButton.heightAnchor.constraint(equalToConstant: 60),
            appleButton.widthAnchor.constraint(equalToConstant: 45),
            
            googleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            googleButton.centerYAnchor.constraint(equalTo: appleButton.centerYAnchor),
            googleButton.heightAnchor.constraint(equalToConstant: 45),
            googleButton.widthAnchor.constraint(equalToConstant: 45),
            
            facebookButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 70),
            facebookButton.centerYAnchor.constraint(equalTo: appleButton.centerYAnchor),
            facebookButton.heightAnchor.constraint(equalToConstant: 45),
            facebookButton.widthAnchor.constraint(equalToConstant: 45),
            
            noAccountLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -50),
            noAccountLabel.centerYAnchor.constraint(equalTo: createHereButton.centerYAnchor),
            noAccountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            createHereButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            createHereButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            createHereButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
