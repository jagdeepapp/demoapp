//
//  AbstractCollectionCell.swift
//  CardsApp
//
//  Created by Jagdeep Singh on 22/11/17.
//  Copyright © 2017 Jk. All rights reserved.
//

import Foundation
import UIKit

class AbstractCollectionCell: UICollectionViewCell { // to call updateWith(model:Any) for all the collections views from one place (from AbstractCollectionListControl)
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        self.contentView.addSubview(imageView)
    }
    
    func updateWith(model:Any) { }
    
    //MARK: - Common code for imageView and label for all subclasses of AbstractCollectionCell
    var label:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Today's Top Hits"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
}
