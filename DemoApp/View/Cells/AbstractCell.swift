//
//  AbstractCell.swift
//  QuizApp
//
//  Created by Raman on 06/12/17.
//  Copyright © 2017 Raman. All rights reserved.
//

import UIKit

class AbstractCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func initViews() {
        self.contentView.backgroundColor = .clear
    }
    
    func updateWith(model:Any) { }
}
