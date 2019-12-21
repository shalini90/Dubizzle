//
//  DubizzleUnitTests.swift
//  DubizzleTests
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import XCTest
@testable import Dubizzle

class DubizzleUnitTests: XCTestCase {
   
    var sut: ClassifiedListViewModel!
    let service: MockApiService = MockApiService()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service.reset()
        sut = ClassifiedListViewModel(service: service)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testListFetch() {
        let expectation = self.expectation(description: "Loading Classified Lists")

        sut.fetchClassifiedList(onSuccess: {
            XCTAssertTrue(self.service.fetchResultsCalled)
            XCTAssertFalse(self.service.parseFailed)
            expectation.fulfill()
        }) { (_) in
            XCTAssertTrue(false)
        }
        waitForExpectations(timeout: 10.0, handler: nil)
    }

    func testListFetchFail() {
        service.shouldReturnError = true
        let expectation = self.expectation(description: "Loading Classified Lists")

        sut.fetchClassifiedList(onSuccess: {
            XCTAssertTrue(false)

        }) { (_) in
            XCTAssertTrue(self.service.fetchResultsCalled)
            XCTAssertTrue(self.service.parseFailed)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
