//
//  GallaryControl.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 14/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import UIKit

class GallaryControl: AbstractControl {

    //MARK: Identifiers
    var albumId = String()
    @IBOutlet weak var gallaryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos"
        let gallaryList = GallaryList.init(collectionViewLayout: FlowLayout.gallaryListCollectionViewLayout)
        gallaryList.getPhotos(albumId:albumId)
        self.addChild(gallaryList, to: gallaryView)
    }

}
