//
//  TellemUITest.swift
//  TellemUITests
//
//  Created by User on 16/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class TellemUITest: XCTestCase {
    
    var app: XCUIApplication!
    
    var deleteKey: XCUIElement!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        deleteKey = app.keyboards.keys["delete"]
    }

    override func tearDown() {
        app = nil
    }
    
    //TODO: Find out why Unit Test Bundle has direct access to localized string and UI Test Bundle not even that the localizable file is included in all bundles of the project

    func localizedString(_ key: String) -> String {
        let bundle = Bundle(for: TellemUITest.self)
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
    
    func doLogin(){
        let emailTextField = app.textFields["email"]
        emailTextField.tap()
        emailTextField.typeText("valid@email.com")
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        app.buttons["LOGIN"].tap()
    }
}
