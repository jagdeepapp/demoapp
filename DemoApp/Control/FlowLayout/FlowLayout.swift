//
//  FlowLayout.swift
//  CardsApp
//
//  Created by Jagdeep Singh on 22/11/17.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation
import UIKit

/*Layouts for all the collection lists*/

class FlowLayout {
    
     static var usersCollectionViewLayout:UICollectionViewFlowLayout = { // users list flowlayout
        let  layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width:UIScreen.main.bounds.size.height * 0.1, height:UIScreen.main.bounds.size.height * 0.1)
        return layout
     }()
    
    static var albumListCollectionViewLayout:UICollectionViewFlowLayout = { // albums list flowlayout
        let  layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width:(UIScreen.main.bounds.size.width - 40) / 3, height:UIScreen.main.bounds.size.width / 3.5)
        return layout
    }()
    
    static var gallaryListCollectionViewLayout:UICollectionViewFlowLayout = { // albums list flowlayout
        let  layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width:(106/320.0) * UIScreen.main.bounds.size.width, height:(106/320.0) * UIScreen.main.bounds.size.width)
        return layout
    }()
}
