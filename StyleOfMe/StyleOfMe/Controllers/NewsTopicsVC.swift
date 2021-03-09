//
//  NewsTopicsVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/3/21.
//

import UIKit

class NewsTopicsVC: UITableViewController {
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}

