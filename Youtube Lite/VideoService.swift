//
//  VideoService.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/8/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import Foundation
import Alamofire
import Argo

class VideoService {
    
    enum Endpoint: String {
        case allVideos = "/videos"
        case trendingVideos = "/videos/trending"
        case subscribedVideos = "/videos/subscriptions"
    }

    static let baseUrl = "https://vapor-rest.herokuapp.com/api"
    
    static func fetch(endPoint: Endpoint, _ onComplete: @escaping (Error?, [Video]?) -> Void) {
        var videos = [Video]()
        
        Alamofire.request(baseUrl + endPoint.rawValue).responseJSON { response in
            if let jsonArray = response.result.value as? [Any] {
                
                for jsonElement in jsonArray {
                    let video: Video? = decode(jsonElement)
                    videos.append(video!)
                }
                
                onComplete(response.result.error, videos)
            }else {
                onComplete(response.result.error, nil)
            }
        }
    }
}

extension VideoService {
    

    
}
