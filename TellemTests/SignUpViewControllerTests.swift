//
//  SignUpViewControllerTests.swift
//  TellemTests
//
//  Created by User on 15/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class SignUpViewControllerTests: XCTestCase {

    var signUpVC: SignUpViewController!
    
    override func setUp() {
        signUpVC = SignUpViewController()
        _ = signUpVC.view
    }

    override func tearDown() {
    }
    
    func testPlaceHolders() {
        let viewModel = signUpVC.viewModel
        XCTAssertEqual(signUpVC.emailTextField.placeholder, viewModel?.emailPlaceHolder)
        XCTAssertEqual(signUpVC.confirmEmailTextField.placeholder, viewModel?.confirmEmailPlaceholder)
        XCTAssertEqual(signUpVC.passwordTextField.placeholder, viewModel?.passwordPlacehoder)
        XCTAssertEqual(signUpVC.confirmPasswordTextField.placeholder, viewModel?.confirmPasswordPlaceholder)
    }
    
    func testButtonTitles() {
        let viewModel = signUpVC.viewModel
        XCTAssertEqual(signUpVC.loginButton.titleLabel!.text, viewModel?.loginButtonTitle)
        XCTAssertEqual(signUpVC.signUpButton.titleLabel!.text, viewModel?.signUpButtonTitle)
    }
    
    func testLabelText(){
        let viewModel = signUpVC.viewModel
        XCTAssertEqual(signUpVC.haveAnAccountLabel.text, viewModel?.haveAnAccountText)
    }
    
    func testButtonEnabled(){
        signUpVC.emailTextField.text = "example@email.com"
        signUpVC.confirmEmailTextField.text = "example@email.com"
        signUpVC.passwordTextField.text = "password"
        signUpVC.confirmPasswordTextField.text = "password"
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmPasswordTextField)
        XCTAssertTrue(signUpVC.signUpButton.isEnabled)
        XCTAssertEqual(signUpVC.signUpButton.alpha, 1.0)
    }
    
    func testButtonDisabled(){
        signUpVC.emailTextField.text = "example@email.com"
        signUpVC.confirmEmailTextField.text = "test@gmail.com"
        signUpVC.passwordTextField.text = "password"
        signUpVC.confirmPasswordTextField.text = "secretword"
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmPasswordTextField)
        XCTAssertFalse(signUpVC.signUpButton.isEnabled)
        XCTAssertEqual(signUpVC.signUpButton.alpha, 0.5)
    }
}
