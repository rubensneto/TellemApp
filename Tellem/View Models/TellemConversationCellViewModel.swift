//
//  TellemConversationCellViewModel.swift
//  Tellem
//
//  Created by Rubens Neto on 19/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

enum TellemMessageStatus: Int {
    case pending = 0
    case sent = 1
    case delivered = 2
    case read = 3
}

class TellemConversationCellViewModel {
    var message: TellemMessage
    var profileName: String
    var profileImage: UIImage
    var lastMessage: String!
    var lastMessageTimestamp: Date
    var newMessages: Int
    var lastMessageStatus: TellemMessageStatus!
    var messageStatusImage: TellemMessageStatusImage
    
    init(message: TellemMessage){
        self.message = message
        self.profileName = message.interlocutor.name
        self.profileImage = message.interlocutor.profileImage
        self.lastMessage = message.text
        self.lastMessageTimestamp = message.timeStamp
        self.newMessages = message.interlocutor.newMessages
        self.lastMessageStatus = message.status
        self.messageStatusImage = TellemMessageStatusImage(messageStatus: message.status)
    }
}


