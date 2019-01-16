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
                setUpViewModel()
                layoutIfNeeded()
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
    
    // HELPERS
    
    
    private func setUpViewModel(){
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
                if viewModel.profileName == "Kate Peterson"{
                    print(viewModel.profileName)
                }
                newMessageAlertLabel.text = "\(viewModel.newMessages)"
                newMessageAlertLabel.sizeToFit()
                newMessageAlertView.sizeToFit()
                newMessageAlertView.layer.cornerRadius = 8.5
            } else {
                newMessageAlertView.isHidden = true
                newMessageAlertLabel.text = ""
            }
        }
        
    }
    
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
