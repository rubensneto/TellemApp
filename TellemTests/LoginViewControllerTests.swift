//
//  TellemLoginViewControllerTests.swift
//  TellemTests
//
//  Created by User on 10/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class TellemLoginViewControllerTests: XCTestCase {
    
    var loginVC: TellemLoginViewController!

    override func setUp() {
        loginVC = TellemLoginViewController()
        loginVC.viewDidLoad()
    }

    override func tearDown() {
        loginVC = nil
    }
    
    func testThatEmailWarningApperars(){
        // GIVEN
        loginVC.emailTextField.text = "invalid@email.c"
        // WHEN
        loginVC.textFieldDidChange(loginVC.emailTextField)
        loginVC.textFieldDidEndEditing(loginVC.emailTextField)
        // THEN
        let warning = loginVC.emailWarningLabel.text
        let localizedString = LocalizedString.invalidEmailWarning
        XCTAssertEqual(warning, localizedString)
    }
    
    func testThatEmailWarningDisapperars(){
        // GIVEN
        loginVC.emailWarningLabel.text = LocalizedString.invalidEmailWarning
        loginVC.emailTextField.text = "valid@email.com"
        // WHEN
        loginVC.textFieldDidChange(loginVC.emailTextField)
        loginVC.textFieldDidEndEditing(loginVC.emailTextField)
        // THEN
        let warning = loginVC.emailWarningLabel.text
        XCTAssertEqual(warning, "")
    }
    
    func testThatPasswordoWarningAppears(){
        // GIVEN
        loginVC.passwordTextField.text = "12345"
        // WHEN
        loginVC.textFieldDidChange(loginVC.passwordTextField)
        loginVC.textFieldDidEndEditing(loginVC.passwordTextField)
        // THEN
        let warning = loginVC.passwordWarningLabel.text
        let localizedString = LocalizedString.invalidPasswordWarning
        XCTAssertEqual(warning, localizedString)
    }
    
    func testThatPasswordWarningDisapperars(){
        // GIVEN
        loginVC.passwordWarningLabel.text = LocalizedString.invalidPasswordWarning
        loginVC.passwordTextField.text = "123456"
        // WHEN
        loginVC.textFieldDidChange(loginVC.passwordTextField)
        loginVC.textFieldDidEndEditing(loginVC.passwordTextField)
        // THEN
        let warning = loginVC.passwordWarningLabel.text
        XCTAssertEqual(warning, "")
    }
    
    func testThatLoginButtonEnables(){
        // GIVEN
        loginVC.emailTextField.text = "example@email.com"
        loginVC.passwordTextField.text = "password"
        // WHEN
        loginVC.textFieldDidChange(loginVC.emailTextField)
        loginVC.textFieldDidChange(loginVC.passwordTextField)
        // THEN
        XCTAssertTrue(loginVC.loginButton.isEnabled)
        XCTAssertEqual(loginVC.loginButton.alpha, 1.0)
    }
    
    func testThatLoginButtonDisables(){
        // GIVEN
        loginVC.emailTextField.text = "invalid@email.c"
        loginVC.passwordTextField.text = "text"
        // WHEN
        loginVC.textFieldDidChange(loginVC.emailTextField)
        loginVC.textFieldDidChange(loginVC.passwordTextField)
        // THEN 
        XCTAssertFalse(loginVC.loginButton.isEnabled)
        XCTAssertEqual(loginVC.loginButton.alpha, 0.5)
    }
    
    
    func testLocalizedString(){
        let string = LocalizedString.signUp
        XCTAssertEqual(string, "Sign up")
    }
}
