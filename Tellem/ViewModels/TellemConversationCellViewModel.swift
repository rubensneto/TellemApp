//
//  TellemConversationCellViewModel.swift
//  Tellem
//
//  Created by Rubens Neto on 19/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

enum MessageStatus: Int {
    case pending = 0
    case sent = 1
    case delivered = 2
    case read = 3
}

class TellemConversationCellViewModel {
    var indexPath: IndexPath!
    var profileName: String!
    var profileImage: UIImage!
    var lastMessage: String!
    var lastMessageTimestamp: String!
    var newMessages: String?
    var lastMessageStatus: MessageStatus!
    
    var messageStatusImage: UIImage {
        switch lastMessageStatus! {
        case .pending: return UIImage(named: "messagePendingStatus")!
        case .sent: return UIImage(named: "messageSentStatus")!
        case .delivered: return UIImage(named: "messageDeliveredStatus")!
        case .read: return UIImage(named: "messageReadStatus")!
        }
    }

    init(profileName: String, profileImage: UIImage, lastMessage: String, lastMessageTimestamp: String, newMessages: String?, lastMessageStatus: MessageStatus){
        self.profileName = profileName
        self.profileImage = profileImage
        self.lastMessage = lastMessage
        self.lastMessageTimestamp = lastMessageTimestamp
        self.newMessages = newMessages
        self.lastMessageStatus = lastMessageStatus
    }
    
    //    init(message: TellemMessage){
//
//    }
    
}


