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
    
    var viewModel: TellemMessageCellViewModel! {
        didSet{
            if viewModel != nil {
                layoutSubviews()
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            messageLabel.text = viewModel.text
            messageTimestampLabel.text = viewModel.timestamp.hour()
            messageBubbleView.layer.cornerRadius = 8.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
