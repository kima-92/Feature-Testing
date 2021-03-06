//
//  SecondVCUITests.swift
//  Unit and UI TestingUITests
//
//  Created by macbook on 7/23/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import XCTest

/*
My review documentation of UI and Unit Testing https://docs.google.com/document/d/1B01B6QdtugYsiXKyFS61Ir3m58na_GrLZDVZvldJ9HA/edit
 */

class SecondVCUITests: XCTestCase {
    
    func testAddText() {
        
        // An instance of this app
        let app = XCUIApplication()
        app.launch()
        
        // Tap on Next button on FirstVC
        app.buttons["Next"].tap()
        
        // Save an instance of the Name textField
        let nameTxtField = app.textFields["Name"]
        
        // Tap on the name TextField
        nameTxtField.tap()
        
        // Add text
        nameTxtField.typeText("Wilma")
        
        // numbers textField
        let numbersTextField = app.textFields["Numbers"]
        
        // tap on it
        numbersTextField.tap()
        numbersTextField.tap()
        numbersTextField.tap()
        
        // Add numbers
        numbersTextField.typeText("1234")
        
        // This is how it recorded the string1 textField
        let stringTextField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).matching(identifier: "String").element(boundBy: 0)
        
        // Tap on the string1 textField
        stringTextField.tap()
        
        // Add some string
        stringTextField.typeText("Some string")
        
        // This is how it recorded the top Navigation Bar
        let unitAndUiTestingSecondviewNavigationBar = app.navigationBars["Unit_and_UI_Testing.SecondView"]
        
        // Add bar button
        let addBarButton = unitAndUiTestingSecondviewNavigationBar.buttons["Add"]
        
        // Tap on add button
        addBarButton.tap()
        
        // How it recorded tapping on the back button
        unitAndUiTestingSecondviewNavigationBar.buttons["Back"].tap()
    }
    
    func testSecondAddTxt() {
        
        let app = XCUIApplication()
        app.launch()
        
        // Tap on Next
        app/*@START_MENU_TOKEN@*/.staticTexts["Next"]/*[[".buttons[\"Next\"].staticTexts[\"Next\"]",".staticTexts[\"Next\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Tap on numbers TxtFiled
        app.textFields["Numbers"].tap()
        
        // Using the "NameTxtFieldyes" ACCESSIBILITY IDENTIFIER to get the nameTextField
        let nameTextField = app.textFields["NameTxtFieldyes"]
        
        // tap on the nameTxtField
        nameTextField.tap()
        nameTextField.tap()
        
        // add some text
        nameTextField.typeText("Wilma")
        
        // Grab the NavigationBar
        let unitAndUiTestingSecondviewNavigationBar = app.navigationBars["Unit_and_UI_Testing.SecondView"]
        
        // Add button
        unitAndUiTestingSecondviewNavigationBar.buttons["Add"].tap()
        // Back button
        unitAndUiTestingSecondviewNavigationBar.buttons["Back"].tap()
    }
}
