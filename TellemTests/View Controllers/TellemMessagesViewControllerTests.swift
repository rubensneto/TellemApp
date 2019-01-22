//
//  TellemMessagesViewControllerTests.swift
//  TellemTests
//
//  Created by Rubens Neto on 11/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class TellemMessagesViewControllerTests: XCTestCase {
    
    var messagesVC: TellemMessagesViewController!

    override func setUp() {
        messagesVC = TellemMessagesViewController()
    }

    override func tearDown() {
        messagesVC = nil
    }
    
    func testThatTableViewExistes(){
        XCTAssertNotNil(messagesVC.tableView)
    }
    
    
    
    
}
