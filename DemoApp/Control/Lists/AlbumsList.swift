//
//  AlbumsList.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//


import Foundation
import UIKit

class AlbumsList: AbstractCollectionListControl {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getAlbumsList() {
        ServiceManager.sharedInstance.getMethod(urlStr: kAlbums, parametersDic: nil) { (responseDic, responseArr, message) in
            if let arr = responseArr {
                self.itemsArr = arr as! [Any]
            }
        }
    }
    
    override var cellClass: AbstractCollectionCell.Type { // passing cell class
        return AlbumCollectionCell.self
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let visibleVC = UIApplication.visibleViewController
        let vc = visibleVC?.storyboard?.instantiateViewController(withIdentifier: kGallaryId) as? GallaryControl
        vc?.albumId = "1"//itemsArr[indexPath.row] as! Dictionary<String,Any>
        visibleVC?.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

