//
//  DateExtensionTests.swift
//  TellemTests
//
//  Created by Rubens Neto on 04/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class DateExtensionTests: XCTestCase {
    
    func testThatTellemDateStringReturnsCorrectValueForYesterday(){
        // GIVEN
        let twentyFourHours: Double = 60 * 60 * 24
        let yesterday = Date(timeIntervalSinceNow: -twentyFourHours)
        // WHEN
        let tellemString = yesterday.tellemDateString(type: .conversationCell)
        // THEN
        XCTAssertEqual(tellemString, LocalizedString.yesterday)
    }
    
    func testThatTellemDateStringReturnsCorrectValueForARemoteGivenDate(){
        //GIVEN
        let expectedOutputString = "21/06/1987"
        let unixTimestampForMyDOB = 551262033.0 // 21/06/1987
        let date = Date(timeIntervalSince1970: unixTimestampForMyDOB)
        //WHEN
        let tellemString = date.tellemDateString(type: .conversationCell)
        // THEN
        XCTAssertEqual(tellemString, expectedOutputString)
    }
    
    func testThatDateStringReturnsTodayString(){
        // GIVEN
        let date = Date()
        // WHEN
        let string = date.tellemDateString(type: .messagesSection)
        // THEN
        XCTAssertEqual(string, LocalizedString.today)
    }
}
