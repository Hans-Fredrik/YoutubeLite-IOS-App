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
    
    static let baseUrl = "https://vapor-rest.herokuapp.com/api/videos"
    
    static func getAllVideos(_ onComplete: @escaping (Error?, [Video]?) -> Void) {
        var videos = [Video]()
        
        Alamofire.request("\(baseUrl)").responseJSON { response in
            
            if let jsonArray = response.result.value as? [Any] {
            
                for jsonElement in jsonArray {
                    let video: Video? = decode(jsonElement)
                    videos.append(video!)
                }
                
                onComplete(response.result.error, videos)
            }else {
                print("That did not happen")
                onComplete(response.result.error, nil)
            }
        }
    }
    
    
}
