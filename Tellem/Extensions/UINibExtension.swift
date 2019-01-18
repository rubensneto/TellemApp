//
//  UINibExtension.swift
//  Tellem
//
//  Created by Rubens Neto on 16/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

extension UINib {
    struct identifier {
        static let conversationSenderTableViewCell = "TellemConversationSenderTableViewCell"
        static let conversationReceiverTableViewCell = "TellemConversationReceiverTableViewCell"
        static let tellemIncomingMessageTableViewCell = "TellemIncomingMessageTableViewCell"
        static let tellemOutgoingMessageTableViewCell = "TellemOutgoingMessageTableViewCell"
    }
    
    struct tableViewCell {
        static let conversationSenderTableViewCell = UINib(nibName: "TellemConversationSenderTableViewCell", bundle: nil)
        static let conversationReceiverTableViewCell = UINib(nibName: "TellemConversationReceiverTableViewCell", bundle: nil)
        static let tellemIncomingMessageTableViewCell = UINib(nibName: "TellemIncomingMessageTableViewCell", bundle: nil)
        static let tellemOutgoingMessageTableViewCell = UINib(nibName: "TellemOutgoingMessageTableViewCell", bundle: nil)
    }
}
