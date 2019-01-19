//
//  TellemSignUpViewController.swift
//  Tellem
//
//  Created by User on 15/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemSignUpViewController: TellemViewController {
    
    var validEmail = false
    var emailMatches = false
    var validPassword = false
    var passwordMatches = false

    
    //MARK: UI Elements
    
    let emailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.placeholder = LocalizedString.email
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    let emailWarningLabel: TellemWarningLabel = {
        let label = TellemWarningLabel()
        return label
    }()
    
    let confirmEmailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.placeholder = LocalizedString.confirmEmail
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    let emailMatchWarningLabel: TellemWarningLabel = {
        let label = TellemWarningLabel()
        return label
    }()
    
    let passwordTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.isSecureTextEntry = true
        textField.placeholder = LocalizedString.password
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    let passwordWarningLabel: TellemWarningLabel = {
        let label = TellemWarningLabel()
        return label
    }()
    
    let confirmPasswordTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.isSecureTextEntry = true
        textField.placeholder = LocalizedString.confirmPassword
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    let passwordMatchWarningLabel: TellemWarningLabel = {
        let label = TellemWarningLabel()
        return label
    }()
    
    let signUpButton: TellemButton = {
        let button = TellemButton(title: LocalizedString.signUp)
        button.isEnabled = false
        button.alpha = 0.5
        button.addTarget(self, action: #selector(doRegister), for: .touchUpInside)
        return button
    }()
    
    let haveAnAccountLabel: UILabel = {
        var label = UILabel()
        label.text = LocalizedString.alreadyHaveAnAccount
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginButton: TellemTextButton = {
        let button = TellemTextButton(title: LocalizedString.login)
        button.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        return button
    }()
    
    //MARK: Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = LocalizedString.signUp
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpView()
        setUpTextField()
    }
    
    //MARK: USER ACTIONS
    
    @objc func doRegister(){
        navigationController?.pushViewController(TellemSearchViewController(), animated: true)
    }
    @objc func backToLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Constraints
    
    func setUpView(){
        
        view.backgroundColor = .white
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(emailWarningLabel)
        emailWarningLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4).isActive = true
        emailWarningLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailWarningLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        view.addSubview(confirmEmailTextField)
        confirmEmailTextField.topAnchor.constraint(equalTo: emailWarningLabel.bottomAnchor, constant: 12).isActive = true
        confirmEmailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        confirmEmailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        confirmEmailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(emailMatchWarningLabel)
        emailMatchWarningLabel.topAnchor.constraint(equalTo: confirmEmailTextField.bottomAnchor, constant: 4).isActive = true
        emailMatchWarningLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailMatchWarningLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailMatchWarningLabel.bottomAnchor, constant: 24).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordWarningLabel)
        passwordWarningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4).isActive = true
        passwordWarningLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordWarningLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordWarningLabel.bottomAnchor, constant: 12).isActive = true
        confirmPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        confirmPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordMatchWarningLabel)
        passwordMatchWarningLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 4).isActive = true
        passwordMatchWarningLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordMatchWarningLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        view.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: passwordMatchWarningLabel.bottomAnchor, constant: 24).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(haveAnAccountLabel)
        haveAnAccountLabel.topAnchor.constraint(greaterThanOrEqualTo: signUpButton.bottomAnchor, constant: 24).isActive = true
        haveAnAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: haveAnAccountLabel.bottomAnchor, constant: 12).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -24).isActive = true
    }

}

extension TellemSignUpViewController: UITextFieldDelegate {
    
    func setUpTextField(){
        emailTextField.delegate = self
        confirmEmailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Only one warning should be displayed at a time.
        
        if let emailString = emailTextField.text, let confirmEmailString = confirmEmailTextField.text,
            let passwordString = passwordTextField.text, let confirmPasswordString = confirmPasswordTextField.text {
            emailWarningLabel.text = ""
            emailMatchWarningLabel.text = ""
            passwordWarningLabel.text = ""
            passwordMatchWarningLabel.text = ""
            if !validEmail && emailString.count > 0 {
                emailWarningLabel.text = LocalizedString.invalidEmailWarning
            } else if !emailMatches && confirmEmailString.count > 0 {
                emailMatchWarningLabel.text = LocalizedString.emailsDontMatchWarning
            } else if !validPassword && passwordString.count > 0 {
                passwordWarningLabel.text = LocalizedString.invalidPasswordWarning
            } else if !passwordMatches && confirmPasswordString.count > 0 {
                passwordMatchWarningLabel.text = LocalizedString.passwordsDontMatchWarning
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        
        // At each call it validate the users' data and update warning labels and sign up button
        
        if let emailString = emailTextField.text, let confirmEmailString = confirmEmailTextField.text,
            let passwordString = passwordTextField.text, let confirmPasswordString = confirmPasswordTextField.text {
            
            validEmail = false
            emailMatches = false
            validPassword = false
            passwordMatches = false
            
            if emailString.isValidEmail() {
                validEmail = true
                emailWarningLabel.text = ""
            }
            if emailString == confirmEmailString {
                emailMatches = true
                emailMatchWarningLabel.text  = ""
            }
            if passwordString.count >= 6 {
                validPassword = true
                passwordWarningLabel.text = ""
            }
            if passwordString == confirmPasswordString {
                passwordMatches = true
                passwordMatchWarningLabel.text = ""
            }
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
