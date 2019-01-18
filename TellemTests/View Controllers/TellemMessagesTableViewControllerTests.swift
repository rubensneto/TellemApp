//
//  TellemMessagesTableViewControllerTests.swift
//  TellemTests
//
//  Created by User on 17/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class TellemMessagesTableViewControllerTests: XCTestCase {
    
    var messagesTVC: TellemMessagesTableViewController!

    override func setUp() {
        messagesTVC = TellemMessagesTableViewController()
    }

    override func tearDown() {
        messagesTVC = nil
    }
    
    func testThatTableViewExists(){
        XCTAssertNotNil(messagesTVC.tableView)
    }
    
    func testThaTableViewHasTreeCells(){
        
    }


}
