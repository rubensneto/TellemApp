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
    var profileName: String
    var profileImage: UIImage
    var lastMessage: String!
    var lastMessageTimestamp: String
    var newMessages: Int
    var lastMessageStatus: MessageStatus!
    var displayMessageStatusView: Bool
    
    var messageStatusImage: UIImage {
        switch lastMessageStatus! {
        case .pending: return UIImage(named: "messagePendingStatus")!
        case .sent: return UIImage(named: "messageSentStatus")!
        case .delivered: return UIImage(named: "messageDeliveredStatus")!
        case .read: return UIImage(named: "messageReadStatus")!
        }
    }
    
    init(message: TellemMessage){
        self.profileName = message.interlocutor.name
        self.profileImage = message.interlocutor.profileImage
        self.lastMessage = message.text
        self.lastMessageTimestamp = message.timeStamp.tellemDateString()
        self.newMessages = message.interlocutor.newMessages
        self.lastMessageStatus = message.status
        
        let senderId = UserDefaults.standard.value(forKey: "userId") as! Int
        displayMessageStatusView =  message.senderId == senderId
    }
}


