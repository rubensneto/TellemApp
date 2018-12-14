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
    
    func testThatButtonEnables(){
        // GIVEN
        signUpVC.emailTextField.text = "example@email.com"
        signUpVC.confirmEmailTextField.text = "example@email.com"
        signUpVC.passwordTextField.text = "password"
        signUpVC.confirmPasswordTextField.text = "password"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmPasswordTextField)
        // THEN
        XCTAssertTrue(signUpVC.signUpButton.isEnabled)
        XCTAssertEqual(signUpVC.signUpButton.alpha, 1.0)
    }
    
    func testThatButtonDisables(){
        // GIVEN
        signUpVC.emailTextField.text = "example@email.com"
        signUpVC.confirmEmailTextField.text = "test@gmail.com"
        signUpVC.passwordTextField.text = "password"
        signUpVC.confirmPasswordTextField.text = "secretword"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmPasswordTextField)
        // THEN
        XCTAssertFalse(signUpVC.signUpButton.isEnabled)
        XCTAssertEqual(signUpVC.signUpButton.alpha, 0.5)
    }
}
