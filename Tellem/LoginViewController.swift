//
//  ViewController.swift
//  Tellem
//
//  Created by User on 10/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel! {
        didSet{
            emailTextField.placeholder = viewModel.emailTextFieldPlaceHolder
            passwordTextField.placeholder = viewModel.passwordTextFieldPlaceholder
        }
    }
    
    var emailTextField: TellemTextField = {
        let textField = TellemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = TellemTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var haveAnAccountLabel: UILabel = {
        var label = UILabel()
        label.text = "Don't have an anccount yet?"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "System", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.font = UIFont(name: "System", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        edgesForExtendedLayout = []
        setUpView()
        setUpTextField()
    }
    
    func setUpView(){
        
        view.backgroundColor = .white
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24).isActive = true
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
    
    
}

