//
//  TellemUITests.swift
//  TellemUITests
//
//  Created by Rubens Neto on 14/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class LoginViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testThatUIElementsExist(){
        XCTAssertTrue(app.textFields["email"].exists)
        XCTAssertTrue(app.secureTextFields["password"].exists)
        XCTAssertTrue(app.buttons["Login"].exists)
        XCTAssertTrue(app.staticTexts["Don't have an account yet?"].exists)
        XCTAssertTrue(app.buttons["Sign up"].exists)
    }
    
    func testThatLoginButtonEnables(){
        let emailTextField = app.textFields["email"]
        emailTextField.tap()
        emailTextField.typeText("valid@email.com")
        
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Login"].tap()
        XCTAssertTrue(app.staticTexts["test"].waitForExistence(timeout: 5))
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
}
