//
//  TellemConversationTableViewModel.swift
//  TellemTests
//
//  Created by Rubens Neto on 04/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class TellemConversationTableViewModelTests: XCTestCase {
    
    var viewModel: TellemConversationTableViewModel!

    override func setUp() {
        viewModel = TellemConversationTableViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }

    func testThatCellsArrayIsSortedByMostRecentMessages() {
        // GIVEN
        var booleanCount = true
        var previousDate = Date()
        // WHEN
        for cellModel in viewModel.cellModels {
            print(cellModel.lastMessageTimestamp)
            booleanCount = booleanCount && cellModel.lastMessageTimestamp < previousDate
            previousDate = cellModel.lastMessageTimestamp
        }
        // THEN
        XCTAssertTrue(booleanCount)
    }

}
