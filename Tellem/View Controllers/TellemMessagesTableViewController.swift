//
//  TellemMessagesTableViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 11/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessagesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.tableViewCell.tellemIncomingMessageTableViewCell, forCellReuseIdentifier: UINib.identifier.tellemIncomingMessageTableViewCell)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = UINib.identifier.tellemIncomingMessageTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TellemMessageTableViewCell
        cell.messageLabel.text = "i"
        return cell
    }
}
