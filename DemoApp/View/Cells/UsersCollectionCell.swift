//
//  UsersCollectionCell.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import UIKit

class UsersCollectionCell: AbstractCollectionCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.contentView.frame
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
    }
    
    override func updateWith(model: Any) {
        imageView.image = #imageLiteral(resourceName: "user")
    }

    
}
