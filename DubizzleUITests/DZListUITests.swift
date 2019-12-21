//
//  DZListUITests.swift
//  DubizzleUITests
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import XCTest

class DZListUITests: DubbizleBaseUITest, ClassifiedListStarting {
    
    var firstCell: XCUIElement? {
        let table = app.tables[AccessiblityIds.classifiedsTableView]
        if table.exists && table.cells.count > 0 {
            return table.cells.element(boundBy: 0)
        }
        return nil
    }
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListLoading() {
        let table = app.tables[AccessiblityIds.classifiedsTableView]
        XCTAssert(table.exists && table.cells.count > 0)
    }
    
    func testListData() {
        if let cell = firstCell {
            XCTAssertTrue(cell.staticTexts[AccessiblityIds.listNameLabel].label.isEmpty == false, "List cell has no name label")
            XCTAssertTrue(cell.staticTexts[AccessiblityIds.listPriceLabel].label.isEmpty == false, "List cell has no price label")
        
        } else {
            XCTAssertTrue(false, "Classified List has no cells")
        }
    }
    
    func testSearch() {
        let searchBar = XCUIApplication().otherElements["SearchBar"].children(matching: .other).element.children(matching: .searchField).element
    
        if let cell = firstCell {
            searchBar.tap()
            searchBar.typeText(cell.staticTexts[AccessiblityIds.listNameLabel].label)
            app.buttons["Search"].tap()
        }
    }
    
    func testDetailLoading() {
        let table = app.tables[AccessiblityIds.classifiedsTableView]
        if table.exists && table.cells.count > 0 {
            table.cells.element(boundBy: 0).tap()
            let detailView = app.otherElements[AccessiblityIds.classifiedDetailView]
            XCTAssert(detailView.waitForExistence(timeout: 2.0))
        } else {
            XCTAssertTrue(false, "DetailView loading failed")
        }
    }
}
