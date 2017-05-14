//
//  Setting.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/13/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import UIKit


struct Setting {
    
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
}


extension Setting {
    enum SettingName: String {
        case help = "Help"
        case cancel = "Cancel"
        case settings = "Settings"
        case sendFeedback = "Send feedback"
        case switchAccount = "Switch Account"
        case termsAndPrivacy = "Terms & Privacy"
    }
}
