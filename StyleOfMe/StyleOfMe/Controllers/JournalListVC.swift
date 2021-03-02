//
//  JournalListVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 2/16/21.
//

import UIKit


class JournalListVC: UITableViewController {
    let cellId = "cellId"
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JournalCell
//        
//        let thisJournal: Item!
//        thisJournal = journalList[indexPath.row]
//        
//        cell.titleLabel.text = thisJournal.name
//        print(cell.titleLabel.text)
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }
}
