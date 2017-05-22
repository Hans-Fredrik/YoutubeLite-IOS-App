//
//  Video.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/1/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import Argo
import Curry
import Runes

struct Video {
    
    var title: String?
    var imageName: String?
    var numberOfViews: Int64?
    var duration: Int?
    var channel: Channel?
    
}

extension Video: Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Video> {
        return curry(self.init)
            <^> json <| "title"
            <*> json <| "thumbnail_image_name"
            <*> json <| "number_of_views"
            <*> json <| "duration"
            <*> json <| "channel"
    }
        
}
