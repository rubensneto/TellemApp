//
//  SignUpViewController.swift
//  Tellem
//
//  Created by User on 15/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    var viewModel: SignUpViewModel! {
        didSet{
            emailTextField.placeholder = viewModel.emailPlaceHolder
            confirmEmailTextField.placeholder = viewModel.confirmEmailPlaceholder
            passwordTextField.placeholder = viewModel.passwordPlacehoder
            confirmPasswordTextField.placeholder = viewModel.confirmEmailPlaceholder
            haveAnAccountLabel.text = viewModel.haveAnAccountText
            loginButton.setTitle(viewModel.loginButtonTitle, for: .normal)
            signUpButton.setTitle(viewModel.signUpButtonTitle, for: .normal)
        }
    }
    
    var emailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var confirmEmailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = TellemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var confirmPasswordTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var haveAnAccountLabel: UILabel = {
        var label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.font = UIFont(name: "System", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        edgesForExtendedLayout = []
        setUpView()
    }
    
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
