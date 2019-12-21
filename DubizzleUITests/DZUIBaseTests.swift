//
//  DZUITestBase.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 12/21/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

import XCTest

protocol StartupConfigurable {
    func configureStartup()
}

//Classified List Initial Setup
protocol ClassifiedListStarting: StartupConfigurable {
    func startClassifiedList()
}

extension ClassifiedListStarting {
    
    func startClassifiedList() {
        let app = XCUIApplication()
        let tableView = app.tables[AccessiblityIds.classifiedsTableView]
        var counter = 1
        while !tableView.exists || counter < 5 {
            sleep(3)
            counter = counter + 1
        }
    }
    
    func configureStartup() {
         startClassifiedList()
    }
}

//Classified Detail Initial Setup
protocol ClassifiedDetailStarting: ClassifiedListStarting {
    func startDetailScreen()
}

extension ClassifiedDetailStarting {
    func startDetailScreen() {
        let app = XCUIApplication()
        let classifiedListTable = app.tables[AccessiblityIds.classifiedsTableView]
        classifiedListTable.cells.allElementsBoundByIndex[0].tap()
        sleep(1)
    }
    
    func configureStartup() {
        startClassifiedList()
        startDetailScreen()
    }
}

class DubbizleBaseUITest: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        (self as? StartupConfigurable)?.configureStartup()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



}
