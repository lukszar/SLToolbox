//
//  UIColorTests.swift
//  SLToolboxTests
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import XCTest

class UIColorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testColorInitialization_shouldCreateRed() {
        // Arrange
        let red = 255
        let green = 0
        let blue = 0
        let targetColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        // Act
        let myColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        // Asserts
        XCTAssertEqual(targetColor, myColor)
    }

}
