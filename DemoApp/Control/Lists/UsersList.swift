//
//  UsersList.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import Foundation
import UIKit

protocol UsersListProtocol: class {
    func didSelect(userId:String)
}
class UsersList: AbstractCollectionListControl {
    
    weak var delegate:UsersListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.contentInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        getUsersList()
    }
    
    func getUsersList() {
        ServiceManager.sharedInstance.getMethod(urlStr: kUsers, parametersDic: nil) { (responseDic, responseArr, message) in
            if let arr = responseArr {
                self.itemsArr = arr as! [Any]
            }
            
        }
    }
    
    override var cellClass: AbstractCollectionCell.Type { // passing cell class
        return UsersCollectionCell.self
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        (UIApplication.visibleViewController as? ViewController)?.msgLbl.isHidden = true
        let user = UsersModel.init(object: itemsArr[indexPath.row])
        delegate?.didSelect(userId: String(user.internalIdentifier ?? 0))
    }
    
}

