//
//  SignUpViewControllerUITests.swift
//  TellemUITests
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class SignUpViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func testThatUIElementsExist(){
        app.buttons[LocalizedString.signUp].tap()
        XCTAssertTrue(app.textFields[LocalizedString.email].exists)
        XCTAssertTrue(app.textFields[LocalizedString.confirmEmail].exists)
        XCTAssertTrue(app.secureTextFields[LocalizedString.password].exists)
        XCTAssertTrue(app.secureTextFields[LocalizedString.confirmPassword].exists)
        XCTAssertTrue(app.buttons[LocalizedString.signUp].exists)
        XCTAssertTrue(app.staticTexts[LocalizedString.alreadyHaveAnAccount.localize()].exists)
        XCTAssertTrue(app.buttons[LocalizedString.login].exists)
    }
}
