//
//  TellemUITests.swift
//  TellemUITests
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class LoginViewControllerUITests: BaseUITest {
    
    //TODO: Find out why Unit Test Bundle has direct access to localized string and UI Test Bundle not even that the localizable file is included in all bundles of the project
    
    private var emailTextField: XCUIElement {
        return app.textFields[localizedString(LocalizedString.email)]
    }
    private var emailWarningLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.invalidEmailWarning)]
    }
    private var passwordTextField: XCUIElement {
        return app.secureTextFields[localizedString(LocalizedString.password)]
    }
    private var loginButton: XCUIElement {
        return app.buttons[localizedString(LocalizedString.login).uppercased()]
    }
    private var haveAnAccountLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.alreadyHaveAnAccount)]
    }
    private var signUpButton: XCUIElement {
        return app.buttons[localizedString(LocalizedString.signUp).uppercased()]
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
        if app.buttons["Choose My Own Password"].exists {
            app.buttons["Choose My Own Password"].tap()
        }
        emailTextField.tap()
        emailTextField.typeText(".com")
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertFalse(emailWarningLabel.exists)
    }
    
    private func typeInvalidEmail(){
        emailTextField.tap()
        emailTextField.typeText("invalid@email")
    }
    
}
