//
//  TellemConversationTableViewCell.swift
//  Tellem
//
//  Created by Rubens Neto on 17/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemConversationTableViewCell: UITableViewCell {
    
    var viewModel: TellemConversationCellViewModel! {
        didSet {
            setUpAccessibilityIdentifiers()
            setUpViewModel()
            setUpLayout()
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Tellem.mediumBold
        return label
    }()
    
    let timeStampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Tellem.medium
        return label
    }()
    
    let messageStatusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.Tellem.mediumSmall
        return label
    }()
    
    let newMessageAlertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tellem.blue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let newMessageAlertLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Tellem.white
        label.font = UIFont.Tellem.medium
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpLayout(){
        
        addSubview(profileImageView)
        addSubview(timeStampLabel)
        addSubview(nameLabel)
        addSubview(messageStatusImageView)
        addSubview(newMessageAlertView)
        addSubview(messageLabel)
        addSubview(newMessageAlertLabel)
        
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        timeStampLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        timeStampLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        timeStampLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(greaterThanOrEqualTo: timeStampLabel.leftAnchor, constant: -6).isActive = true
        
        messageStatusImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        messageStatusImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 14).isActive = true
        messageStatusImageView.centerYAnchor.constraint(equalTo: messageLabel.centerYAnchor).isActive = true
        messageStatusImageView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        
        messageLabel.leftAnchor.constraint(equalTo: messageStatusImageView.rightAnchor, constant: 2).isActive = true
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        messageLabel.rightAnchor.constraint(lessThanOrEqualTo: newMessageAlertView.leftAnchor, constant: -6).isActive = true
        
        newMessageAlertLabel.topAnchor.constraint(equalTo: timeStampLabel.bottomAnchor, constant: 6).isActive = true
        newMessageAlertLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -18).isActive = true
        newMessageAlertLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        newMessageAlertView.centerYAnchor.constraint(equalTo: newMessageAlertLabel.centerYAnchor).isActive = true
        newMessageAlertView.centerXAnchor.constraint(equalTo: newMessageAlertLabel.centerXAnchor).isActive = true
        newMessageAlertView.heightAnchor.constraint(equalTo: newMessageAlertLabel.heightAnchor).isActive = true
        
        let newMessageAlertViewWidthConstraint =  newMessageAlertView.widthAnchor.constraint(equalTo: newMessageAlertLabel.widthAnchor)
        newMessageAlertViewWidthConstraint.isActive = true
        newMessageAlertViewWidthConstraint.constant = newMessageAlertViewWidthConstraint.constant + 12
        
        if !viewModel.displayMessageStatusView {
            messageStatusImageView.isHidden = true
            messageLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        }
        
        setSubviewsAutoResizingMask()
    }
    
    
    // HELPERS
    
    func setSubviewsAutoResizingMask(){
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpViewModel(){
        profileImageView.image = viewModel.profileImage
        nameLabel.text = viewModel.profileName
        messageLabel.text = viewModel.lastMessage
        timeStampLabel.text = viewModel.lastMessageTimestamp.tellemDateString()
        viewModel.newMessages > 0 ? (newMessageAlertLabel.text = "\(viewModel.newMessages)") : (newMessageAlertLabel.text = "")
        messageStatusImageView.image = viewModel.messageStatusImage.image
    }
    
    private func setUpAccessibilityIdentifiers(){
        typealias AccessId = AccessibilityIdentifier.ConversationCell
        let row = "\(viewModel.indexPath.row)"
        profileImageView.accessibilityIdentifier = AccessId.profileImage + row
        nameLabel.accessibilityIdentifier = AccessId.profileName + row
        messageLabel.accessibilityIdentifier = AccessId.lastMessage + row
        timeStampLabel.accessibilityIdentifier = AccessId.timestamp + row
        accessibilityIdentifier = AccessId.conversationCell + row
    }

}
