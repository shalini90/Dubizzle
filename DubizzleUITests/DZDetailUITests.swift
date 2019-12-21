//
//  DZDetailUITests.swift
//  DubizzleUITests
//
//  Created by Shalini Padmanabhan on 12/21/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

import XCTest

class DZDetailUITests: DubbizleBaseUITest, ClassifiedDetailStarting {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoading() {
        XCTAssertTrue(app.staticTexts[AccessiblityIds.detailNameLabel].label.isEmpty == false, "DetailView has no name label")
        
        XCTAssertTrue(app.staticTexts[AccessiblityIds.detailPriceLabel].label.isEmpty == false, "DetailView has no price label")
    }

}
