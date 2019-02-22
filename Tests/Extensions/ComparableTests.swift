//
//  ComparableTests.swift
//  SLToolboxTests
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import XCTest

class ComparableTests: XCTestCase {

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

    func testComparableClampedExtension_shouldClampFromOverUpperLimits() {
        //Arrange
        let myNumber = 20
        let limit: ClosedRange = 5...10
        // Act
        let newValue = myNumber.clamped(to: limit)
        // Asserts
        XCTAssert(newValue == 10)
    }

    func testComparableClampedExtension_shouldClampFromOverLowerLimits() {
        // Arrange
        let myNumber = 4
        let limit: ClosedRange = 5...10
        // Act
        let newValue = myNumber.clamped(to: limit)
        // Asserts
        XCTAssert(newValue == 5)
    }

    func testComparableClampedExtension_shouldNotClampInsideLimits() {
        // Arrange
        let myNumber = 6
        let limit: ClosedRange = 5...10
        // Act
        let newValue = myNumber.clamped(to: limit)
        // Asserts
        XCTAssert(newValue == 6)
    }

}
