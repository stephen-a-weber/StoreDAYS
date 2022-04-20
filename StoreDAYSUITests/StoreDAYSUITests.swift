//
//  StoreDAYSUITests.swift
//  StoreDAYSUITests
//
//  Created by stephen weber on 4/18/22.
//

import XCTest

class StoreDAYSUITests: XCTestCase {
    var app :XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
                        
        XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .image).matching(identifier: "SplashScreenPicture").element(boundBy: 0)/*[[".children(matching: .image).matching(identifier: \"pet-image\").element(boundBy: 0)",".children(matching: .image).matching(identifier: \"SplashScreenPicture\").element(boundBy: 0)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let app = XCUIApplication()
        app.tables.cells["There are 5 left from this litter., $14.99"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["Adopt this Kitten"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Pet Store"].tap()
        app.tabBars["Tab Bar"].buttons["Cart"].tap()
        app.buttons["Total : $14.99, Continue To Payment"].tap()
        app.buttons["PAY"].tap()
        
                        
        //        app.windows["hmm"].tap()
//        app/*@START_MENU_TOKEN@*/.tabBars["Tab Bar"]/*[[".otherElements[\"hmm\"].tabBars[\"Tab Bar\"]",".tabBars[\"Tab Bar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Cart"].tap()
//        app/*@START_MENU_TOKEN@*/.buttons["Total : $0.00, Continue To Payment"]/*[[".otherElements[\"hmm\"].buttons[\"Total : $0.00, Continue To Payment\"]",".buttons[\"Total : $0.00, Continue To Payment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.buttons["PAY"]/*[[".otherElements[\"hmm\"].buttons[\"PAY\"]",".buttons[\"PAY\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
                       
    }
}
