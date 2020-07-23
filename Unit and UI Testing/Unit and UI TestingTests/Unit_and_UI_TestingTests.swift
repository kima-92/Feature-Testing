//
//  Unit_and_UI_TestingTests.swift
//  Unit and UI TestingTests
//
//  Created by macbook on 7/23/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import XCTest

// This is the Generic file the App gives you when you create the target for the first time

// You can totally delete this and create new TestsCase files for:
//      * a specific VC file
//      * a specific area of code you want to test in one file

// Or, you can use this file alone and that's it

class Unit_and_UI_TestingTests: XCTestCase {
    
    // SetUp will run BEFORE EACH test
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    // tearDown will run AFTER EACH test
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // This is just an example of how a test should look like
    // If you don't start a test with the word TEST, this file won't recognize it as a test
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // Another example,
    // For mesuring performance
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
