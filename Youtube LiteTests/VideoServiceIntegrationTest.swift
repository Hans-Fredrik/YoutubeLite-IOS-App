//
//  VideoServiceIntegrationTest.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/8/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import XCTest
@testable import Youtube_Lite

class VideoServiceIntegrationTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "asynchronous request")
        
        VideoService.getAllVideos { error, videos in
            if let actualVideos = videos {
                print(actualVideos)
                expectation.fulfill()
            }else{
                print("Tell user that there is some issuse \(error)")
            }
        }
        
        self.waitForExpectations(timeout: 10.0,  handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
