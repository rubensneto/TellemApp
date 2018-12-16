//
//  BaseUITest.swift
//  TellemUITests
//
//  Created by User on 16/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class BaseUITest: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }
    
    //TODO: Find out why Unit Test Bundle has direct access to localized string and UI Test Bundle not even that the localizable file is included in all bundles of the project

    func localizedString(_ key: String) -> String {
        let bundle = Bundle(for: BaseUITest.self)
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}
