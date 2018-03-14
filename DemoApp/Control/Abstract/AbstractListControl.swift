//
//  AbstractListControl.swift
//  QuizApp
//
//  Created by Raman on 06/12/17.
//  Copyright © 2017 Raman. All rights reserved.
//

import UIKit

class AbstractListControl: UITableViewController {
   
    // a common array for all the subclasses
    var itemsArr = [Any]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.setUpTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpTableView() {
        tableView.register(cellClass, forCellReuseIdentifier: String(describing:cellClass))
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        self.tableView.backgroundColor = .clear
    }

    var cellClass:AbstractCell.Type {
        return AbstractCell.self
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:cellClass), for: indexPath) as! AbstractCell
        cell.selectionStyle = .none
        cell.updateWith(model:itemsArr[indexPath.row])
        return cell
    }
   
}
