//
//  TellemMessageTableViewCell.swift
//  Tellem
//
//  Created by User on 17/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBubbleView: UIView!
    @IBOutlet weak var messageTimestampLabel: UILabel!
    @IBOutlet weak var messageStatusImageView: UIImageView!
    @IBOutlet weak var outgoingMessageStackView: UIStackView!
    @IBOutlet weak var messageStatusImageViewWidth: NSLayoutConstraint!
    
    var viewModel: TellemMessageCellViewModel! {
        didSet{
            if viewModel != nil {
                layoutSubviews()
            }
        }
    }
    
    var maxBubbleWidth: CGFloat {
        return frame.width - 100
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageLabel.text = viewModel.text
        messageTimestampLabel.text = viewModel.timestamp.hour()
        messageBubbleView.layer.cornerRadius = 8.5
        if viewModel.flow == .outgoing {
            let statusImage = TellemMessageStatusImage(messageStatus: viewModel.status).image
            messageStatusImageView.image = statusImage
            messageStatusImageViewWidth.constant = messageStatusViewWidth()
        } else {
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func messageStatusViewWidth() -> CGFloat {
        if viewModel.status == .read || viewModel.status == .delivered {
            return 14.57
        }
        return 10
    }

}
