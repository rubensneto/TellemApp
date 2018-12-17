//
//  SignUpViewControllerUITests.swift
//  TellemUITests
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class SignUpViewControllerUITests: BaseUITest {
    
    //TODO: Find out why Unit Test Bundle has direct access to localized string and UI Test Bundle not even that the localizable file is included in all bundles of the project
    
    private var emailTextField: XCUIElement {
        return app.textFields[localizedString(LocalizedString.email)]
    }
    private var confirmEmailTextField: XCUIElement {
        return app.textFields[localizedString(LocalizedString.confirmEmail)]
    }
    private var passwordTextField: XCUIElement {
        return app.secureTextFields[localizedString(LocalizedString.password)]
    }
    private var confirmPasswordTextField: XCUIElement {
        return app.secureTextFields[localizedString(LocalizedString.confirmPassword)]
    }
    private var signUpButton: XCUIElement {
        return app.buttons[localizedString(LocalizedString.signUp).uppercased()]
    }
    private var haveAnAccountLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.alreadyHaveAnAccount)]
    }
    private var loginButton: XCUIElement {
        return app.buttons[localizedString(LocalizedString.login).uppercased()]
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testThatUIElementsExist(){
        app.buttons[localizedString(LocalizedString.signUp).uppercased()].tap()
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(confirmEmailTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        XCTAssertTrue(confirmPasswordTextField.exists)
        XCTAssertTrue(signUpButton.exists)
        XCTAssertTrue(haveAnAccountLabel.exists)
        XCTAssertTrue(loginButton.exists)
    }
}
