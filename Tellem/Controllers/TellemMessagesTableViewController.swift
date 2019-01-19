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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellId = ""
        let cellViewModel = viewModel.cellModels[indexPath.row]
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
    var cellModels = [TellemMessageCellViewModel]()
    
    init (){
        for message in TellemMessageDataSource().messages {
            if message.interlocutor.id == 11111 {
                let cellModel = TellemMessageCellViewModel(message: message)
                cellModels.append(cellModel)
            }
        }
    }
}
