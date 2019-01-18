//
//  TellemMessageCellViewModel.swift
//  Tellem
//
//  Created by Rubens Neto on 18/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

enum TellemMessageFlow {
    case outgoing
    case incoming
}

class TellemMessageCellViewModel {
    var text: String
    var timestamp: Date
    var status: TellemMessageStatus
    var messageStatusImage: TellemMessageStatusImage
    var flow: TellemMessageFlow
    
    init(message: TellemMessage){
        self.text = message.text
        self.timestamp = message.timeStamp
        self.status = message.status
        self.messageStatusImage = TellemMessageStatusImage(messageStatus: message.status)
        message.senderId == message.interlocutor.id ? (flow = .incoming) : (flow = .outgoing)
    }
}


