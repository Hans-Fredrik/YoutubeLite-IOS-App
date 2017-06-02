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
    
    func testAllVideos() {
        let expectation = self.expectation(description: "Async request")
        
        VideoService.fetch(endPoint: .allVideos, {error, videos in
            if let actualVideos = videos {
        
                XCTAssertTrue(actualVideos.count > 0, "Expected more videos")
                expectation.fulfill()
            }
        })
        
        self.waitForExpectations(timeout: 10.0,  handler: nil)
    }
    
    func testTrendingVideos() {
        let expectation = self.expectation(description: "Async request")
        
        VideoService.fetch(endPoint: .trendingVideos, {error, videos in
            if let actualVideos = videos {
                
                XCTAssertTrue(actualVideos.count > 0, "Expected more videos")
                expectation.fulfill()
            }
        })
        
        self.waitForExpectations(timeout: 10.0,  handler: nil)
    }
    
    func testSubscribedVideos() {
        let expectation = self.expectation(description: "Async request")

        VideoService.fetch(endPoint: .subscribedVideos, {error, videos in
            if let actualVideos = videos {
        
                XCTAssertTrue(actualVideos.count > 0, "Expected more videos")
                expectation.fulfill()
            }
        })

        self.waitForExpectations(timeout: 10.0,  handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
