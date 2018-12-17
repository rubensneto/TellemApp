//
//  SignUpViewControllerUITests.swift
//  TellemUITests
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class SignUpViewControllerUITests: StartUpViewControllerUITests {
    
    //TODO: Find out why Unit Test Bundle has direct access to localized string and UI Test Bundle not even that the localizable file is included in all bundles of the project
    
    var confirmEmailTextField: XCUIElement {
        return app.textFields[localizedString(LocalizedString.confirmEmail)]
    }
    var emailMatchWarningLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.emailsDontMatchWarning)]
    }
    var passwordMatchWarningLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.passwordsDontMatchWarning)]
    }
    var confirmPasswordTextField: XCUIElement {
        return app.secureTextFields[localizedString(LocalizedString.confirmPassword)]
    }
    var haveAnAccountLabel: XCUIElement {
        return app.staticTexts[localizedString(LocalizedString.alreadyHaveAnAccount)]
    }

    override func setUp() {
        super.setUp()
        signUpButton.tap()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testThatUIElementsExist(){
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(confirmEmailTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        XCTAssertTrue(confirmPasswordTextField.exists)
        XCTAssertTrue(signUpButton.exists)
        XCTAssertTrue(haveAnAccountLabel.exists)
        XCTAssertTrue(loginButton.exists)
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
        typeInvalidEmail()
        passwordTextField.tap()
        emailTextField.tap()
        emailTextField.typeText(".com")
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertFalse(emailWarningLabel.exists)
    }
    
    func testThatEmailMatchWarningAppears(){
        // GIVEN
        typeValidEmail()
        typeInvalidEmailConfirmation()
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertTrue(emailMatchWarningLabel.exists)
    }
    
    func testThatEmailMatchWarningDisappears(){
        // GIVEN
        typeValidEmail()
        typeInvalidEmailConfirmation()
        passwordTextField.tap()
        confirmEmailTextField.tap()
        confirmEmailTextField.typeText(".com")
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertFalse(emailMatchWarningLabel.exists)
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
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        // WHEN
        emailTextField.tap()
        // THEN
        XCTAssertFalse(passwordWarningLabel.exists)
    }
    
    func testThatPasswordMatchWarningAppears(){
        // GIVEN
        typeValidEmail()
        typeValidEmailConfirmation()
        typeValidPassword()
        typeInvalidPasswordConfirmation()
        // WHEN
        signUpButton.tap()
        // THEN
        XCTAssertTrue(passwordMatchWarningLabel.exists)
    }
    
    func testThatPasswordMatchWarningDisappears(){
        // GIVEN
        typeValidEmail()
        typeInvalidEmailConfirmation()
        passwordTextField.tap()
        confirmEmailTextField.tap()
        confirmEmailTextField.typeText(".com")
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertFalse(emailMatchWarningLabel.exists)
    }
    
    func testThatSignUpButtonEnables(){
        // GIVEN
        fillAllTheFieldsWithValidData()
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: searchTestLabel, handler: nil)
        // WHEN
        signUpButton.tap()
        // THEN
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(searchTestLabel.exists)
    }
    
    func testThaSignUpButtonDisables(){
        // GIVEN
        fillAllTheFieldsWithValidData()
        emailTextField.tap()
        deleteKey.tap()
        deleteKey.tap()
        // WHEN
        signUpButton.tap()
        // THEN
        XCTAssertTrue(emailWarningLabel.exists)
    }
    
    func testThatOnlyTheMostPriorWarningLabelAppearsAtTheTime() {
        // GIVEN
        typeInvalidEmail()
        typeInvalidEmailConfirmation()
        emailTextField.tap()
        emailTextField.typeText(".com")
        // WHEN
        passwordTextField.tap()
        // THEN
        XCTAssertFalse(emailWarningLabel.exists)
        XCTAssertTrue(emailMatchWarningLabel.exists)
    }
    
    //MARK: HELPERS
    
    private func fillAllTheFieldsWithValidData(){
        typeValidEmail()
        typeValidEmailConfirmation()
        typeValidPassword()
        typeValidPasswordConfirmation()
    }
        
    private func typeValidEmailConfirmation(){
        confirmEmailTextField.tap()
        confirmEmailTextField.typeText("valid@email.com")
    }
    
    private func typeInvalidEmailConfirmation(){
        confirmEmailTextField.tap()
        confirmEmailTextField.typeText("valid@email")
    }
    
    private func typeValidPasswordConfirmation(){
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("123456")
    }
    
    private func typeInvalidPasswordConfirmation(){
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("12345")
    }
    
    
}
