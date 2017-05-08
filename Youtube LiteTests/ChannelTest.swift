//
//  ChannelTest.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/1/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import XCTest
import Argo
@testable import Youtube_Lite

class ChannelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testDecodeChannel() {
        let channelJson = getChannelJson()
        
        let channel: Channel? = decode(channelJson!)
        
        XCTAssertNotNil(channel)
        XCTAssertEqual(channel?.name, "Taylor Fan Forever")
        XCTAssertEqual(channel?.profileImageName, "http://brastad.pro:8080/images/taylor_fan_forever_profile.jpg")
    }
    
    
    private func getChannelJson() -> Any? {
        if let json = JsonFileReader.jsonFromFile("channel") {
            return json[0]
        }
        
        return nil
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
