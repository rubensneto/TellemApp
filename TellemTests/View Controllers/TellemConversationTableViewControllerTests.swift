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
        let tableView = conversationsTVC.tableView
        tableView?.register(UINib.tableViewCell.conversationReceiverTableViewCell, forCellReuseIdentifier: UINib.identifier.conversationReceiverTableViewCell)
        tableView?.register(UINib.tableViewCell.conversationSenderTableViewCell, forCellReuseIdentifier: UINib.identifier.conversationSenderTableViewCell)
    }
    
    
    
    override func tearDown() {
        super.tearDown()
        conversationsTVC = nil
        viewModel = nil
    }
    
    func testThatTableViewExists(){
        XCTAssertNotNil(conversationsTVC.tableView)
    }
    
    func testThaNumberOfCellsMatchesViewModel(){
        // GIVEN
        let tableView = conversationsTVC.tableView
        // WHEN
        let numberOfRows = tableView?.numberOfRows(inSection: 0)
        // THEN
        XCTAssertEqual(numberOfRows, viewModel.cellModels.count)
    }
    
    func testThatCellContainingUnreadMessageDisplayBadge(){
        // GIVEN
        let indexPath = IndexPath(row: 0, section: 0)
        // WHEN
        let cell = conversationsTVC.tableView(conversationsTVC.tableView, cellForRowAt: indexPath) as! TellemConversationTableViewCell
        // THEN
        XCTAssertNotNil(cell.newMessageAlertLabel.text)
    }
    
    func testThatCellDisplaysStatusImageForPendingMessages() {
        // GIVEN
        let indexPath = IndexPath(row: 2, section: 0)
        // WHEN
        let cell = conversationsTVC.tableView(conversationsTVC.tableView, cellForRowAt: indexPath) as! TellemConversationTableViewCell
        // THEN
        XCTAssertEqual(cell.viewModel.messageStatusImage.imageName, "messagePendingStatus")
    }
    
    func testThatGinaCellDisplays23NewMessages() {
        // GIVEN
        let indexPath = IndexPath(row: 19, section: 0)
        // WHEN
        let ginaCell = conversationsTVC.tableView(conversationsTVC.tableView, cellForRowAt: indexPath) as! TellemConversationTableViewCell
        let newMessages = ginaCell.newMessageAlertLabel.text
        // THEN
        XCTAssertEqual(newMessages, "22")
    }
}
