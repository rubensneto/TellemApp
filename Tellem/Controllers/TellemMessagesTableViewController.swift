//
//  TellemMessagesTableViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 11/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessagesTableViewController: UITableViewController {
    
    var viewModel = TellemMessagesTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = .clear
        
        tableView.register(UINib.tableViewCell.tellemIncomingMessageTableViewCell, forCellReuseIdentifier: UINib.identifier.tellemIncomingMessageTableViewCell)
        tableView.register(UINib.tableViewCell.tellemOutgoingMessageTableViewCell, forCellReuseIdentifier: UINib.identifier.tellemOutgoingMessageTableViewCell)
        tableView.register(UINib.tableViewCell.tellemMessagesTableViewHeader, forHeaderFooterViewReuseIdentifier: UINib.identifier.tellemMessagesTableViewHeader)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel.cellModelSections.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: UINib.identifier.tellemMessagesTableViewHeader) as! TellemMessagesTableViewHeader
        header.timestamp = viewModel.cellModelSections[section].first!.timestamp
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModelSections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellId = ""
        let cellViewModel = viewModel.cellModelSections[indexPath.section][indexPath.row]
        if cellViewModel.flow == .incoming {
            cellId =  UINib.identifier.tellemIncomingMessageTableViewCell
        } else {
            cellId =  UINib.identifier.tellemOutgoingMessageTableViewCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TellemMessageTableViewCell
        cell.viewModel = cellViewModel
        return cell
    }
}

class TellemMessagesTableViewModel {
    var cellModelSections = [[TellemMessageCellViewModel]]()
    
    init() {
        let userId = UserDefaults.standard.value(forKey: "userId") as! Int
        let amber = TellemUser(id: 11111, name: "Amber Parker", profileImage: UIImage(named: "gatinha1")!)
        
        let amberMessage = TellemMessage(interlocutor: amber, senderId: amber.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages. I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: 0), status: .read)
        amber.newMessages = 1
        amber.lastMessage = amberMessage
        cellModelSections.append([TellemMessageCellViewModel(message:amberMessage)])
        let amberMessage2 = TellemMessage(interlocutor: amber, senderId: userId, receiverId: amber.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(4)), status: .read)
        cellModelSections.append([TellemMessageCellViewModel(message:amberMessage2)])
    }
    
    private func daysAgo(_ days: Double) -> Double {
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        return -(Double(day) * days)
    }
}
