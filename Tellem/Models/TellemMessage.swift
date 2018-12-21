//
//  TellemMessage.swift
//  Tellem
//
//  Created by Rubens Neto on 21/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import Foundation

enum TellemMessageType {
    case text
    case image
}

struct TellemMessage {
    var senderId: Int
    var type: TellemMessageType
    var text: String
    var timeStamp: Date
    var status: MessageStatus
}
