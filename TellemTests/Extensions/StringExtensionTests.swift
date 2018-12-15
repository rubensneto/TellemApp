//
//  StringExtensionTests.swift
//  TellemTests
//
//  Created by User on 14/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class StringExtensionTests: XCTestCase {

    func testThatValidationFailsForInvalidEmailFormat(){
        // GIVEN
        let invalidFormat = "invalid@email.c"
        // WHEN
        let validationResult = invalidFormat.isValidEmail()
        // THEN
        XCTAssertFalse(validationResult)
    }
    
    func testThatValidationPassesForValidEmailFormat(){
        // GIVEN
        let invalidFormat = "valid@email.co.uk"
        // WHEN
        let validationResult = invalidFormat.isValidEmail()
        // THEN
        XCTAssertTrue(validationResult)
    }
    
    func testThatLocalizationReturnsTheRightValue(){
        // GIVEN
        let key = "dontHaveAnAccount"
        // WHEN
        let value = key.localize()
        // THEN
        XCTAssertEqual(value, "Don't have an account yet?")
    }

}
