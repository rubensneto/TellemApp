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
                setNeedsLayout()
            }
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageStatusImageView: UIImageView!
    @IBOutlet weak var messageStatusImageViewWidth: NSLayoutConstraint!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var newMessageAlertView: UIView!
    @IBOutlet weak var newMessageAlertLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.image = viewModel.profileImage
        profileImageView.layer.cornerRadius = 24
        profileImageView.clipsToBounds = true
        
        nameLabel.text = viewModel.profileName
        messageLabel.text = viewModel.lastMessage
        timeStampLabel.text = viewModel.lastMessageTimestamp.tellemDateString()
        
        if reuseIdentifier == UINib.identifier.conversationSenderTableViewCell {
            messageStatusImageView.image = viewModel.messageStatusImage.image
            messageStatusImageViewWidth.constant = messageStatusViewWidth()
        }
        
        if reuseIdentifier == UINib.identifier.conversationReceiverTableViewCell {
            if viewModel.newMessages > 0 {
                newMessageAlertView.isHidden = false
                newMessageAlertLabel.text = "\(viewModel.newMessages)"
                newMessageAlertView.layer.cornerRadius = 8.5
            } else {
                newMessageAlertView.isHidden = true
                newMessageAlertLabel.text = ""
            }
        }
    }
    
    // HELPERS
    
    override func prepareForReuse() {
        print(viewModel.profileName)
    }
    
    private func messageStatusViewWidth() -> CGFloat {
        if viewModel.lastMessageStatus == .read ||
            viewModel.lastMessageStatus == .delivered {
            return 17.485
        }
        return 12
    }
}
