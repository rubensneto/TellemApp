//
//  UILabelExtensionTests.swift
//  TellemTests
//
//  Created by Rubens Neto on 04/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class UILabelExtensionTests: XCTestCase {
    
    var testLabel: UILabel?
    
    override func setUp() {
        super.setUp()
        testLabel = UILabel()
        testLabel!.font = UIFont.Tellem.medium
        testLabel!.text = "123"
    }
    
    override func tearDown() {
        super.tearDown()
        testLabel = nil
    }

    func testKnownCalculatedWidth(){
        XCTAssertEqual(testLabel?.calculatedWidth, 26.5)
    }
    
    func testKnownCalculatedHeight(){
        XCTAssertEqual(testLabel?.calculatedHeight, 19.5)
    }
    
}
