//
//  LoginViewControllerTests.swift
//  TellemTests
//
//  Created by User on 10/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class LoginViewControllerTests: XCTestCase {
    
    var loginVC: LoginViewController!

    override func setUp() {
        loginVC = LoginViewController()
        loginVC.viewDidLoad()
    }

    override func tearDown() {
        loginVC = nil
    }
    
    func testButtonEnabled(){
        loginVC.emailTextField.text = "example@email.com"
        loginVC.passwordTextField.text = "password"
        loginVC.textFieldDidChange(loginVC.emailTextField)
        loginVC.textFieldDidChange(loginVC.passwordTextField)
        XCTAssertTrue(loginVC.loginButton.isEnabled)
        XCTAssertEqual(loginVC.loginButton.alpha, 1.0)
    }
    
    func testButtonDisabled(){
        loginVC.emailTextField.text = "textExample" // Not a valid email
        loginVC.passwordTextField.text = "text" // Not a valid password
        loginVC.textFieldDidChange(loginVC.emailTextField)
        loginVC.textFieldDidChange(loginVC.passwordTextField)
        XCTAssertFalse(loginVC.loginButton.isEnabled)
        XCTAssertEqual(loginVC.loginButton.alpha, 0.5)
    }
}
