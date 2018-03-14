//
//  AlbumCollectionCell.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import Foundation
import UIKit

class AlbumCollectionCell: AbstractCollectionCell {
    
    var tempView:UIView!
    override func initViews() {
        super.initViews()
        tempView = UIView()
        self.contentView.addSubview(tempView)
        self.contentView.addSubview(label)
        tempView.backgroundColor = UIColor.init(red: 1, green: 20/255.0, blue: 147/255.0, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.contentView.frame
        self.contentView.addVisualConstraints(["H:|-2-[label]-2-|","V:[label]-17-|"], subviews: ["label": label])
        self.contentView.addVisualConstraints(["H:|[tempView]|","V:[tempView(39)]|"], subviews: ["tempView": tempView])
    }
    
    override func updateWith(model: Any) {
        imageView.image = #imageLiteral(resourceName: "album")
    }
    
    
}
