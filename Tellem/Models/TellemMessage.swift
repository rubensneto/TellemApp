//
//  TellemMessage.swift
//  Tellem
//
//  Created by Rubens Neto on 21/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

enum TellemMessageType {
    case text
    case image
}

struct TellemMessage {
    var interlocutor: TellemUser
    var senderId: Int
    var receiverId: Int
    var type: TellemMessageType
    var text: String
    var timeStamp: Date
    var status: TellemMessageStatus
}

class TellemUser {
    var id: Int
    var name: String
    var profileImage: UIImage
    var lastMessage: TellemMessage?
    var newMessages: Int = 0
    
    init(id: Int, name: String, profileImage: UIImage){
        self.id = id
        self.name = name
        self.profileImage = profileImage
    }
}


