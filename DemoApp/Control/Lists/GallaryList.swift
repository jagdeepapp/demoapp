//
//  GallaryList.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 14/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import UIKit

class GallaryList: AbstractCollectionListControl {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var cellClass: AbstractCollectionCell.Type { // passing cell class
        return GallaryCell.self
    }
    
    func getPhotos(albumId:String) {
           ServiceManager.sharedInstance.getMethod(urlStr: kPhotos + albumId, parametersDic: nil) { (responseDic, responseArr, message) in
               if let arr = responseArr {
                   self.itemsArr = arr as! [Any]
               }
           }
    }

}
