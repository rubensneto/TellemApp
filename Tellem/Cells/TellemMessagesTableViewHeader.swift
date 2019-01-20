//
//  TellemMessagesTableViewHeader.swift
//  Tellem
//
//  Created by User on 20/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessagesTableViewHeader: UITableViewHeaderFooterView {
    
    var timestamp: Date! {
        didSet {
            timestampLabel.text = timestamp.tellemDateString(type: .messagesSection)
        }
    }
    
    @IBOutlet weak var bubbleView: UIView!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bubbleView.layer.cornerRadius = 8.5
    }

}
