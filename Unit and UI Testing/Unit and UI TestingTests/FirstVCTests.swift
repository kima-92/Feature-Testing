//
//  FirstVCTests.swift
//  Unit and UI TestingTests
//
//  Created by macbook on 7/23/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import XCTest
@testable import Unit_and_UI_Testing
// * This project's Target, and this Unit Test Bundle Target:
// They are separate on purpose!
// To test it, you need to import it with @testable

class FirstVCTests: XCTestCase {
    
    func testSum() {
        let a = 11
        let b = 32
        
        let firstVC = FirstViewController()
        
        let result = firstVC.add(a: a, b: b)
        
        // MARK: - Incorrect
        
        // This will run but it will NEVER Fail the test
        if result == 42 {
            // Test Passed
        } else {
            // Test Failed
        }
        
        // MARK: - Correct
        
        // This is almost the same as above ^^
        // But it will actually Fail the test if it's not true
        XCTAssert(result == 42)
    }
    
    func testSubtract() {
        let a = 1
        let b = 1
        
        let firstVC = FirstViewController()
        
        let result = firstVC.subtract(a: a, b: b)
        
        // Test with custome message
        XCTAssert(result == 10, "testSubtrack did not give expected result")
    }
}
