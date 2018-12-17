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
    }

    override func tearDown() {
        signUpVC = nil
    }
    
    func testThatEmailWarningApperars(){
        // GIVEN
        signUpVC.emailTextField.text = "invalid@email.c"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.emailTextField)
        // THEN
        let warning = signUpVC.emailWarningLabel.text
        let localizedString = LocalizedString.invalidEmailWarning
        XCTAssertEqual(warning, localizedString)
    }
    
    func testThatEmailWarningDisapperars(){
        // GIVEN
        signUpVC.emailWarningLabel.text = LocalizedString.invalidEmailWarning
        signUpVC.emailTextField.text = "valid@email.com"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.emailTextField)
        // THEN
        let warning = signUpVC.emailWarningLabel.text
        XCTAssertEqual(warning, "")
    }
    
    func testThatConfirmEmailWarningApperars(){
        // GIVEN
        signUpVC.emailTextField.text = "valid@email.com"
        signUpVC.confirmEmailTextField.text = "valid@email.c"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.confirmEmailTextField)
        // THEN
        let warning = signUpVC.emailMatchWarningLabel.text
        let localizedString = LocalizedString.emailsDontMatchWarning
        XCTAssertEqual(warning, localizedString)
    }
    
    func testThatConfirmEmailWarningDisapperars(){
        // GIVEN
        signUpVC.emailMatchWarningLabel.text = LocalizedString.emailsDontMatchWarning
        signUpVC.emailTextField.text = "valid@email.com"
        signUpVC.confirmEmailTextField.text = "valid@email.com"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.confirmEmailTextField)
        // THEN
        let warning = signUpVC.emailMatchWarningLabel.text
        XCTAssertEqual(warning, "")
    }
    
    func testThatPasswordoWarningAppears(){
        // GIVEN
        signUpVC.passwordTextField.text = "12345"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.passwordTextField)
        // THEN
        let warning = signUpVC.passwordWarningLabel.text
        let localizedString = LocalizedString.invalidPasswordWarning
        XCTAssertEqual(warning, localizedString)
    }
    
    func testThatPasswordWarningDisapperars(){
        // GIVEN
        signUpVC.passwordWarningLabel.text = LocalizedString.invalidPasswordWarning
        signUpVC.passwordTextField.text = "123456"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.passwordTextField)
        // THEN
        let warning = signUpVC.passwordWarningLabel.text
        XCTAssertEqual(warning, "")
    }
    
    func testThatConfirmPasswordWarningApperars(){
        // GIVEN
        signUpVC.passwordTextField.text = "password"
        signUpVC.confirmPasswordTextField.text = "passwor"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.passwordTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmPasswordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.confirmPasswordTextField)
        // THEN
        let warning = signUpVC.passwordMatchWarningLabel.text
        let localizedString = LocalizedString.passwordsDontMatchWarning
        XCTAssertEqual(warning, localizedString)
    }
    
    func testThatConfirmPasswordWarningDisapperars(){
        // GIVEN
        signUpVC.emailMatchWarningLabel.text = LocalizedString.passwordsDontMatchWarning
        signUpVC.emailTextField.text = "password"
        signUpVC.confirmEmailTextField.text = "password"
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.passwordTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmPasswordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.confirmPasswordTextField)
        // THEN
        let warning = signUpVC.passwordMatchWarningLabel.text
        XCTAssertEqual(warning, "")
    }
    
    func testThatOnlyOneWarningLabelDisplaysAtTheTime(){
        // GIVEN
        signUpVC.emailTextField.text = "valid@email.com"
        signUpVC.confirmEmailTextField.text = "valid@email." // Not a match
        signUpVC.passwordTextField.text = "12345" // Not valid
        // WHEN
        signUpVC.textFieldDidChange(signUpVC.emailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.emailTextField)
        signUpVC.textFieldDidChange(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.confirmEmailTextField)
        signUpVC.textFieldDidChange(signUpVC.passwordTextField)
        signUpVC.textFieldDidEndEditing(signUpVC.passwordTextField)
        // THEN
        let emailMatchWarning = signUpVC.emailMatchWarningLabel.text
        let passwordWarning = signUpVC.passwordWarningLabel.text
        XCTAssertEqual(emailMatchWarning, LocalizedString.emailsDontMatchWarning)
        XCTAssertEqual(passwordWarning, "")
    }
    
    func testThatSignUpButtonDisables(){
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
    
    func testThatSignUpButtonEnables(){
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
    
}
