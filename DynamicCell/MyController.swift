//
//  MyController.swift
//  DynamicTable
//
//  Created by Ioannis Kaliakatsos on 21/08/2015.
//  Copyright (c) 2015 Ioannis Kaliakatsos. All rights reserved.
//

import UIKit

class MyController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(MyCell.self, forCellReuseIdentifier: MyCell.identifier)
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MyCell.identifier, forIndexPath: indexPath) as! MyCell
        cell.photo = UIImage(named: "photo")
        cell.layoutIfNeeded()
        return cell
    }
}
