//
//  TellemMessagesViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 11/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessagesViewController: TellemViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = TellemMessagesTableViewModel()
    
    let tableView: UITableView = {
        let tbv = UITableView()
        tbv.separatorColor = .clear
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
    }()
    
    let messageInputView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tellem.superLightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tellem.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sendPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "photo-camera"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sendTextButton: UIButton = {
        let button = UIButton()
        button.alpha = 0.5
        button.setImage(UIImage(named: "sent-mail"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let messageInputTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 15
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 0.5
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
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
        view.addSubview(messageInputView)
        
        messageInputView.addSubview(separatorView)
        messageInputView.addSubview(sendPhotoButton)
        messageInputView.addSubview(messageInputTextView)
        messageInputView.addSubview(sendTextButton)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: messageInputView.topAnchor).isActive = true
        
        messageInputView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        messageInputView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        messageInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        messageInputView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: messageInputView.topAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: messageInputView.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: messageInputView.rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        sendPhotoButton.leftAnchor.constraint(equalTo: messageInputView.leftAnchor , constant: 8).isActive = true
        sendPhotoButton.bottomAnchor.constraint(equalTo: messageInputView.bottomAnchor , constant: -12).isActive = true
        sendPhotoButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sendPhotoButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        sendTextButton.rightAnchor.constraint(equalTo: messageInputView.rightAnchor , constant: -8).isActive = true
        sendTextButton.bottomAnchor.constraint(equalTo: messageInputView.bottomAnchor , constant: -12).isActive = true
        sendTextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sendTextButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        messageInputTextView.topAnchor.constraint(equalTo: messageInputView.topAnchor, constant: 6).isActive = true
        messageInputTextView.leftAnchor.constraint(equalTo: sendPhotoButton.rightAnchor, constant: 8).isActive = true
        messageInputTextView.rightAnchor.constraint(equalTo: sendTextButton.leftAnchor, constant: -8).isActive = true
        messageInputTextView.bottomAnchor.constraint(equalTo: messageInputView.bottomAnchor, constant: -6).isActive = true
    }
}

