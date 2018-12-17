//
//  TellemUITests.swift
//  TellemUITests
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class LoginViewControllerUITests: StartUpViewControllerUITests {
    
    var haveAnAccountLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.dontHaveAnAccount)]
    }
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testThatUIElementsExist(){
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        XCTAssertTrue(loginButton.exists)
        XCTAssertTrue(haveAnAccountLabel.exists)
        XCTAssertTrue(signUpButton.exists)
    }
    
    func testThatEmailWarningAppears(){
        // GIVEN
        typeInvalidEmail()
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertTrue(emailWarningLabel.exists)
    }
    
    func testThatEmailWarningDisappears(){
        // GIVEN
        passwordTextField.tap() // Without this step the autofill strong passwords shows up
        typeInvalidEmail()
        passwordTextField.tap()
        emailTextField.tap()
        emailTextField.typeText(".com")
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertFalse(emailWarningLabel.exists)
    }
    
    func testThatPasswordWarningAppears(){
        // GIVEN
        typeInvalidPassword()
        // WHEN
        emailTextField.tap()
        // THEN
        XCTAssertTrue(passwordWarningLabel.exists)
    }
    
    func testThatPasswordWarningDisappears(){
        // GIVEN
        typeInvalidPassword()
        emailTextField.tap()
        typeValidPassword()
        // WHEN
        emailTextField.tap()
        // THEN
        XCTAssertFalse(passwordWarningLabel.exists)
    }
    
    func testThatLoginButtonEnables(){
        // GIVEN
        typeValidEmail()
        typeValidPassword()
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: searchTestLabel, handler: nil)
        // WHEN
        loginButton.tap()
        // THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(searchTestLabel.exists)
    }
    
    func testThaLoginButtonDisables(){
        // GIVEN
        typeValidEmail()
        typeValidPassword()
        emailTextField.tap()
        deleteKey.tap()
        deleteKey.tap()
        // WHEN
        loginButton.tap()
        // THEN
        XCTAssertTrue(emailWarningLabel.exists)
    }
    
}
