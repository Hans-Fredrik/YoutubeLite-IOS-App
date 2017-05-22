//
//  SettingCell.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/12/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import Foundation
import UIKit

class SettingCell: BaseCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var setting: Setting? {
        didSet {
            
            if let nameLabel = setting?.name {
                self.nameLabel.text = nameLabel.rawValue
            }
            
            if let imageName = setting?.imageName {
                self.iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                self.iconImageView.tintColor = UIColor.darkGray
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setupViews() {
        super.setupViews()
        
    }
    
}
