//
//  DateTests.swift
//  SLToolboxTests
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {

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

    func testDate_shouldBe2ndJanuaryOf2003() {
        // Arrange
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "YYYY.MM.dd HH:mm:ss"

        let dateString = "2003.01.02 20:12:30"

        // Act
        let myDate = dateFormatter.date(from: dateString)
        // Asserts
        XCTAssert(myDate!.day == 2)
        XCTAssert(myDate!.month == 1)
        XCTAssert(myDate!.year == 2003)
        XCTAssert(myDate!.hour == 20)
        XCTAssert(myDate!.minute == 12)
        XCTAssert(myDate!.second == 30)
    }

}
