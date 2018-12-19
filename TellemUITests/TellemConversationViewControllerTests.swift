//
//  TellemConversationViewControllerTests.swift
//  TellemUITests
//
//  Created by Rubens Neto on 18/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest

class TellemConversationViewControllerTests: TellemUITest {
    
    typealias AccessId = AccessibilityIdentifier.ConversationCell
    private var counter: Int!
    private var range: CountableClosedRange<Int>!
    
    override func setUp() {
        super.setUp()
        counter = app.tables.cells.count
        range = 0...(counter - 1)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatUIElementsExist(){
        if counter > 0 {
            for index in range {
                XCTAssertTrue(app.tables.cells[AccessId.conversationCell + "\(index)"].exists)
                XCTAssertTrue(app.images[AccessId.profileImage + "\(index)"].exists)
                XCTAssertTrue(app.staticTexts[AccessId.profileName + "\(index)"].exists)
                XCTAssertTrue(app.staticTexts[AccessId.lastMessage + "\(index)"].exists)
                XCTAssertTrue(app.staticTexts[AccessId.timestamp + "\(index)"].exists)
            }
        }
    }
}
