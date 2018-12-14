//
//  SignUpViewController.swift
//  Tellem
//
//  Created by User on 15/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var validEmail = false
    var emailMatches = false
    var validPassword = false
    var passwordMatches = false
    
    //MARK: UI Elements
    
    var emailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.placeholder = NSLocalizedString("email", comment: "")
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var confirmEmailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.placeholder = NSLocalizedString("confirmEmail", comment: "")
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = TellemTextField()
        textField.placeholder = NSLocalizedString("password", comment: "")
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var confirmPasswordTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.placeholder = NSLocalizedString("confirmPassword", comment: "")
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("signUp", comment: ""), for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 0.5
        button.isEnabled = false
        button.alpha = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var haveAnAccountLabel: UILabel = {
        var label = UILabel()
        label.text = NSLocalizedString("alreadyHaveAnAccount", comment: "")
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.font = UIFont(name: "System", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        edgesForExtendedLayout = []
        setUpView()
        setUpTextField()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: Constraints
    
    func setUpView(){
        
        view.backgroundColor = .white
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(confirmEmailTextField)
        confirmEmailTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        confirmEmailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        confirmEmailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        confirmEmailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: confirmEmailTextField.bottomAnchor, constant: 24).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        confirmPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        confirmPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 24).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(haveAnAccountLabel)
        haveAnAccountLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 60).isActive = true
        haveAnAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: haveAnAccountLabel.bottomAnchor, constant: 12).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

extension SignUpViewController: UITextFieldDelegate {
    
    func setUpTextField(){
        emailTextField.delegate = self
        confirmEmailTextField.delegate = self
        passwordTextField.delegate = self
        confirmEmailTextField.delegate = self
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        
        switch textField {
        case emailTextField:
            validEmail = false
            if let emailString = emailTextField.text {
                if emailString.isValidEmail() {
                    validEmail = true
                }
            }
        case confirmEmailTextField:
            emailMatches = false
            if confirmEmailTextField.text == emailTextField.text {
                emailMatches = true
            }
        case passwordTextField:
            validPassword = false
            if let passwordString = passwordTextField.text {
                if passwordString.count >= 6 {
                    validPassword = true
                }
            }
        case confirmPasswordTextField:
            if confirmPasswordTextField.text == passwordTextField.text {
                passwordMatches = true
            }
        default:
            print("error")
        }
        
        toggleSendButton()
    }
    
    func toggleSendButton(){
        if validEmail && validPassword
        && emailMatches && passwordMatches {
            signUpButton.isEnabled = true
            signUpButton.alpha = 1.0
        } else {
            signUpButton.isEnabled = false
            signUpButton.alpha = 0.5
        }
    }
}
