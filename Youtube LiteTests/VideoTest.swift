//
//  VideoTest.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/1/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import XCTest
import Argo
@testable import Youtube_Lite

class VideoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecodeOneVideo() {
        let json =  getVideoJson()
        let video: Video? = decode(json!)
        
        XCTAssertNotNil(video)
        XCTAssertNotNil(video?.title)
        XCTAssertNotNil(video?.imageName)
        XCTAssertNotNil(video?.numberOfViews)
        XCTAssertNotNil(video?.duration)
        XCTAssertNotNil(video?.channel)
    }
 
    func testChildObjectsIsProperlyDecoded() {
        let json =  getVideoJson()
        let video: Video? = decode(json!)
        
        XCTAssertNotNil(video)
        XCTAssertNotNil(video?.channel)
        XCTAssertNotNil(video?.channel?.name)
        XCTAssertNotNil(video?.channel?.profileImageName)
    }
    
    func testDecodeMulitpleVideos() {
        var videos = [Video]()
        
        if let jsonArray = getAllVideosJson() {
            
            for json in jsonArray {
                if let video: Video = decode(json) {
                    videos.append(video)
                }
            }
            
        }
    
        XCTAssertEqual(videos.count, 6)
    }
    
    func getAllVideosJson() -> [Any]? {
        return JsonFileReader.jsonFromFile("videos")
    }
    
    private func getVideoJson() -> Any? {
        if let json = JsonFileReader.jsonFromFile("video"){
            return json[0]
        }
        
        return nil
    }
    
}
