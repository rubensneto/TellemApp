//
//  TellemConversationTableViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 17/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemConversationTableViewController: TellemTableViewController {
   
    let cellId = "ConversationCellId"
    var viewModel = TellemConversationTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = LocalizedString.chats
        tableView.register(UINib(nibName: "TellemConversationTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TellemConversationTableViewCell
        let cellViewModel = viewModel.cellModels[indexPath.row]
        cellViewModel.indexPath = indexPath
        cell.viewModel = cellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TellemConversationTableViewCell
        if cell.viewModel != nil { cell.viewModel = nil }
    }
}
