//
//  Channel.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/1/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import Argo
import Curry
import Runes

struct Channel {
    
    var name: String?
    var profileImageName: String?
    
}

extension Channel: Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Channel> {
        return curry(self.init)
            <^> json <| "name"
            <*> json <| "profile_image_name"
    }
    
}
