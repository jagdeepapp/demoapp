//
//  GallaryCell.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 14/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import UIKit

class GallaryCell: AbstractCollectionCell {
   
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.contentView.frame
    }
    
    override func updateWith(model: Any) {
        let album = AlbumModel.init(object: model)
        imageView.setImage(url:URL.init(string: album.thumbnailUrl ?? ""), placeholderImage:#imageLiteral(resourceName: "album"))
    }
    
}
