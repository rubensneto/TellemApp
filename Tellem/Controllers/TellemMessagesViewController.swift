//
//  TellemMessagesViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 11/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = TellemMessagesTableViewModel()
    
    let tableView: UITableView = {
        let tbv = UITableView()
        tbv.separatorColor = .clear
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messageInputView: TellemMessageInputView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 42)
        let inputView = TellemMessageInputView(frame: frame)
        inputView.translatesAutoresizingMaskIntoConstraints = false
        return inputView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib.tableViewCell.tellemIncomingMessageTableViewCell, forCellReuseIdentifier: UINib.identifier.tellemIncomingMessageTableViewCell)
        tableView.register(UINib.tableViewCell.tellemOutgoingMessageTableViewCell, forCellReuseIdentifier: UINib.identifier.tellemOutgoingMessageTableViewCell)
        tableView.register(UINib.tableViewCell.tellemMessagesTableViewHeader, forHeaderFooterViewReuseIdentifier: UINib.identifier.tellemMessagesTableViewHeader)
        
        setUpUI()
    }

    // MARK: - Table view data source
    


    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel.cellModelSections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: UINib.identifier.tellemMessagesTableViewHeader) as! TellemMessagesTableViewHeader
        header.timestamp = viewModel.cellModelSections[section].first!.timestamp
        return header
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModelSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
    // UI
    func setUpUI(){
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(messageInputView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //containerView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        messageInputView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        messageInputView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        messageInputView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        messageInputView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        messageInputView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        containerView.sizeToFit()
    }
}

