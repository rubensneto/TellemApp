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
            if viewModel != nil {
                setUpAccessibilityIdentifiers()
                setUpViewModel()
                setUpLayout()
            }
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageStatusImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageLabelLeadingToMessageStatus: NSLayoutConstraint!
    @IBOutlet weak var messageLabelLeadingToProfileImage: NSLayoutConstraint!
    @IBOutlet weak var newMessageAlertView: UIView!
    @IBOutlet weak var newMessageAlertViewWidth: NSLayoutConstraint!
    @IBOutlet weak var newMessageAlertLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // HELPERS
    
    private func setUpLayout(){
        profileImageView.layer.cornerRadius = 24
        profileImageView.clipsToBounds = true
        newMessageAlertView.layer.cornerRadius = 8.5
        
        messageStatusImageView.isHidden = !viewModel.displayMessageStatusView
        messageLabelLeadingToProfileImage.isActive = messageStatusImageView.isHidden
        messageLabelLeadingToMessageStatus.isActive = !messageStatusImageView.isHidden
        
        newMessageAlertViewWidth.constant = messageStatusViewWidth()
        
        setNeedsUpdateConstraints()
    }
    
    private func messageStatusViewWidth() -> CGFloat {
        if viewModel.lastMessageStatus == .read ||
            viewModel.lastMessageStatus == .delivered {
            return 17.485
        }
        return 12
    }
    
    private func setSubviewsAutoResizingMask(){
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
        messageStatusImageView.isHidden = !viewModel.displayMessageStatusView
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
