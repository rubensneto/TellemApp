//
//  StartUpViewControllerTests.swift
//  TellemUITests
//
//  Created by Rubens Neto on 17/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class StartUpViewControllerUITests: BaseUITest {
    
    var emailTextField: XCUIElement {
        return app.textFields[localizedString(LocalizedString.email)]
    }
    var emailWarningLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.invalidEmailWarning)]
    }
    var passwordTextField: XCUIElement {
        return app.secureTextFields[localizedString(LocalizedString.password)]
    }
    var passwordWarningLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.invalidPasswordWarning)]
    }
    var signUpButton: XCUIElement {
        return app.buttons[localizedString(LocalizedString.signUp).uppercased()]
    }
    var loginButton: XCUIElement {
        return app.buttons[localizedString(LocalizedString.login).uppercased()]
    }
    var searchTestLabel: XCUIElement {
        return app.staticTexts["test"]
    }
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: HELPERS
    
    func typeValidEmail(){
        emailTextField.tap()
        emailTextField.typeText("valid@email.com")
    }
    
    func typeValidPassword(){
        passwordTextField.tap()
        passwordTextField.typeText("123456")
    }
    
    
    func typeInvalidEmail(){
        emailTextField.tap()
        emailTextField.typeText("invalid@email")
    }
    
    func typeInvalidPassword(){
        passwordTextField.tap()
        passwordTextField.typeText("12345")
    }
    
}
