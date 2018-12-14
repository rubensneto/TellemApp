//
//  SearchViewControllerUITests.swift
//  TellemUITests
//
//  Created by Rubens Neto on 14/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class SearchViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    // HELPERS
    
    private func navigateToSearchPage(){
        let emailTextField = app.textFields["email"]
        emailTextField.tap()
        emailTextField.typeText("valid@email.com")
        
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Login"].tap()
    }
    
}
