//
//  PostsCell.swift
//  QuizApp
//
//  Created by Jagdeep Singh on 06/12/17.
//  Copyright © 2017 Jk. All rights reserved.
//

import UIKit

class PostsCell: AbstractCell {

    var containerView: UIView!
    
    override func initViews() {
        super.initViews()
        containerView = UIView()
        self.contentView.addSubview(containerView)
        contentView.backgroundColor = .gray
        containerView.addSubview(label)
        containerView.backgroundColor =  UIColor.darkGray
        
        self.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addVisualConstraints(["H:|[containerView]|","V:|-4-[containerView]-4-|"], subviews: ["containerView": containerView])
        containerView.addVisualConstraints(["H:|-10-[label]-10-|","V:|-7-[label]-7-|"], subviews: ["label":label])
    }
    
    override func updateWith(model: Any) {
        super.updateWith(model: model)
        let post = PostsModel.init(object: model)
        label.text = post.title
    }
    
    var label:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
}
