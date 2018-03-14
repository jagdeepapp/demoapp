//
//  PostDetailControl.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 14/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import UIKit

class PostDetailControl: AbstractControl {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var txtView: UITextView!
    var post:PostsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
        self.title = "Post Detail"
        if post != nil {
            titleLbl.text = post.title
            txtView.text = post.body
        }
    }

}
