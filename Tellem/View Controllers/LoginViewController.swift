//
//  ViewController.swift
//  Tellem
//
//  Created by User on 10/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
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
    
    let passwordTextField: UITextField = {
        let textField = TellemTextField()
        if #available(iOS 12, *) {
            textField.textContentType = .oneTimeCode
        }
        textField.placeholder = LocalizedString.password
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    let passwordWarningLabel: TellemWarningLabel = {
        let label = TellemWarningLabel()
        return label
    }()
    
    let loginButton: TellemButton = {
        let button = TellemButton(title: LocalizedString.login)
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()
    
    let haveAnAccountLabel: UILabel = {
        var label = UILabel()
        label.text = LocalizedString.dontHaveAnAccount
        label.accessibilityIdentifier = "haveAnAccount"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signUpButton: TellemTextButton = {
        let button = TellemTextButton(title: LocalizedString.signUp)
        button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return button
    }()
    
    var isValidEmail = false
    var isValidPassword = false
    
    //MARK: VIEW CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        edgesForExtendedLayout = []
        setUpView()
        setUpTextField()
        hideKeyboardWhenTappedAround()
        
    }
    
    //MARK: USER ACTIONS
    
    @objc func showSignUp(){
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    //MARK: UI SET UP
    
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
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailWarningLabel.bottomAnchor, constant: 24).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordWarningLabel)
        passwordWarningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4).isActive = true
        passwordWarningLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordWarningLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordWarningLabel.bottomAnchor, constant: 24).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(haveAnAccountLabel)
        haveAnAccountLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 60).isActive = true
        haveAnAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: haveAnAccountLabel.bottomAnchor, constant: 12).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func setUpTextField(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            if !isValidEmail {
                emailWarningLabel.text = LocalizedString.invalidEmailWarning
            }
        }
        
        if textField == passwordTextField {
            if !isValidPassword {
                passwordWarningLabel.text = LocalizedString.invalidPasswordWarning
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        
        if textField == emailTextField {
            isValidEmail = false
            if let emailString = emailTextField.text {
                if emailString.isValidEmail() {
                    isValidEmail = true
                    emailWarningLabel.text = ""
                }
            }
        }
        
        if textField == passwordTextField {
            isValidPassword = false
            if let passwordString = passwordTextField.text {
                if passwordString.count >= 6 {
                    isValidPassword = true
                    passwordWarningLabel.text = ""
                }
            }
        }
        toggleSendButton()
    }
    
    func toggleSendButton(){
        if isValidEmail && isValidPassword {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
}

