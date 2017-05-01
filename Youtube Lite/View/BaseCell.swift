//
//  BaseCell.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 4/30/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not been implemented")
    }
}
