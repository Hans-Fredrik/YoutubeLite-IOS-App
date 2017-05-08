//
//  JsonFileReader.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/1/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import Foundation
import UIKit

class JsonFileReader {
    
    class func jsonFromFile(_ filename: String) -> [Any]? {

        do {
            let testBundle = Bundle(for: self)
            let path = testBundle.path(forResource: filename, ofType: "json")
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            
            if let json: Any = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) {
                return json as? [Any]
            }
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
}
