//
//  Art_InspectorUITests.swift
//  Art-InspectorUITests
//
//  Created by Swapna Dirisala on 7/28/25.
//

import XCTest

final class Art_InspectorUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testManualLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.exists)
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testButtonClick() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Check that the buttons are present
        XCTAssertTrue(app.buttons["openFileButton"].exists)
        XCTAssertTrue(app.buttons["settingsButton"].exists)
        XCTAssertTrue(app.buttons["exportReportButton"].exists)
    }
    
    func testTapButton() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["openFileButton"].tap()
        app.buttons["settingsButton"].tap()
        app.buttons["exportReportButton"].tap()
    }
    
    func testDropArea() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["dropArea"].exists)
    }
}
