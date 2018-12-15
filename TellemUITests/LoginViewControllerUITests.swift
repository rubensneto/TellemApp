//
//  TellemUITests.swift
//  TellemUITests
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class LoginViewControllerUITests: XCTestCase {
    
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
        XCTAssertTrue(app.textFields[LocalizedString.email].exists)
        XCTAssertTrue(app.secureTextFields[LocalizedString.password].exists)
        XCTAssertTrue(app.buttons[LocalizedString.login].exists)
        XCTAssertTrue(app.staticTexts[LocalizedString.dontHaveAnAccount].exists)
        XCTAssertTrue(app.buttons[LocalizedString.signUp].exists)
    }
}
