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
    @IBOutlet weak var messageBubbleView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubbleView.layer.cornerRadius = 8.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
