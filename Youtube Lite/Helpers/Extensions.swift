//
//  Extensions.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 4/30/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
    
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

extension UIColor {
    
    static let youtubeRed = {
        return UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
    }()
    
    static let youtubeBlack = {
        return UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
    }()
    
    static let youtubeLightGray = {
        return UIColor(red: 230/250, green: 230/255, blue: 230/255, alpha: 1)
    }()
    
}
