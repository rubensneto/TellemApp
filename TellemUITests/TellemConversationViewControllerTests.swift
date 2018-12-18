//
//  TellemConversationViewControllerTests.swift
//  TellemUITests
//
//  Created by Rubens Neto on 18/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class TellemConversationViewControllerTests: TellemUITest {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatUIElementsExist(){
        doLogin()
        XCTAssertTrue(app.staticTexts["Rubens Neto"].exists)
        
    }
    
}
