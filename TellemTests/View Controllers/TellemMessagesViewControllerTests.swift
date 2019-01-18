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
    
    var messagesTVC: TellemMessagesTableViewController!

    override func setUp() {
        messagesTVC = TellemMessagesTableViewController()
    }

    override func tearDown() {
        messagesTVC = nil
    }
    
    func testThatTableViewExistes(){
        XCTAssertNotNil(messagesTVC.tableView)
    }
    
    
    
    
}
