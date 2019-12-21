//
//  DubizzleIntegrationTests.swift
//  DubizzleTests
//
//  Created by Shalini Padmanabhan on 12/22/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

import XCTest
@testable import Dubizzle

class DubizzleIntegrationTests: XCTestCase {
    let service = ApiService()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClassifiedListApi() {
        let expectation = self.expectation(description: "Loading Classified Lists")
        service.fetchResults(onSuccess: { (results) in
            if !results.isEmpty {
                for result in results {
                    XCTAssertTrue(!result.name.isEmpty, "ResultItem does not contain name")
                    XCTAssertTrue(!result.price.isEmpty, "ResultItem does not contain price")
                    if let imagesURLS = result.imageUrls {
                        for imageUrl in imagesURLS {
                                               XCTAssertNotNil(URL(string: imageUrl))
                        }
                    } else {
                        XCTAssertTrue(false, "Image Urls Array is nil")
                    }
                }
                expectation.fulfill()
            } else {
                XCTAssertTrue(results.isEmpty, "No reslult items fetched")
            }
        }) { (error) in
            XCTAssertTrue(false, "Classified list API failed")
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
}
