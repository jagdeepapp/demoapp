//
//  PostsList.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import Foundation
import UIKit

class PostsList: AbstractListControl {
    
    
    //MARK: Super class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        (UIApplication.visibleViewController as? ViewController)?.postsHeight.constant = self.tableView.contentSize.height
    }
    func getPostsList() {
        ServiceManager.sharedInstance.getMethod(urlStr: kPosts, parametersDic: nil) { (responseDic, responseArr, message) in
            if responseArr != nil {
                self.itemsArr = responseArr as! [Any]
            }
        }
    }
    
    override var cellClass: AbstractCell.Type { // to pass cell
        return PostsCell.self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let visibleVC = UIApplication.visibleViewController
        let vc = visibleVC?.storyboard?.instantiateViewController(withIdentifier: kPostsDetailsId) as? PostDetailControl
        vc?.post = PostsModel.init(object: itemsArr[indexPath.row])
        visibleVC?.navigationController?.pushViewController(vc!, animated: true)
    }

}
