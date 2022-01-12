//
//  NewsFeedDemoTests.swift
//  NewsFeedDemoTests
//
//  Created by Karun Aggarwal on 10/01/22.
//

import XCTest
@testable import NewsFeedDemo

class NewsFeedDemoTests: XCTestCase {
    var homeService = HomeServiceMock()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testDashboardViewModel_NewsData_Success() {
        let expectation = self.expectation(description: "News server response")
        homeService.getDashboard { (response, error, status) in
            XCTAssertNotNil(status, "true")
            XCTAssertEqual(status!, "True")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 10)
    }
}
