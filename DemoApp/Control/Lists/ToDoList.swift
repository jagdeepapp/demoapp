//
//  ToDoList.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import Foundation
import UIKit

class ToDoList: AbstractListControl {
    
    //MARK: Super class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        (UIApplication.visibleViewController as? ViewController)?.todoHeight.constant = self.tableView.contentSize.height
    }
    
    func getTodoList() {
        ServiceManager.sharedInstance.getMethod(urlStr: kToDo, parametersDic: nil) { (responseDic, responseArr, message) in
            if let arr = responseArr {
                self.itemsArr = arr as! [Any]
            }
        }
    }
    
    override var cellClass: AbstractCell.Type { // to pass cell
        return PostsCell.self
    }
    
    
}
