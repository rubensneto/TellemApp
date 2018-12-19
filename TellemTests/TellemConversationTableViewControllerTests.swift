//
//  TellemConversationTableViewControllerTests.swift
//  TellemTests
//
//  Created by Rubens Neto on 19/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class TellemConversationTableViewControllerTests: XCTestCase {
    
    var conversationsTVC: TellemConversationTableViewController!
    var viewModel: TellemConversationTableViewModel!
    override func setUp() {
        super.setUp()
        
        conversationsTVC = TellemConversationTableViewController()
        viewModel = TellemConversationTableViewModel()
        conversationsTVC.viewModel = viewModel
    }
    
    override func tearDown() {
        super.tearDown()
        conversationsTVC = nil
        viewModel = nil
    }
    
    func testThaNumberOfCellsMatchViewModel(){
        // GIVEN
        let tableView = conversationsTVC.tableView
        // WHEN
        let numberOfRows = tableView?.numberOfRows(inSection: 0)
        // THEN
        XCTAssertEqual(numberOfRows, viewModel.cellModels.count)
    }
}
