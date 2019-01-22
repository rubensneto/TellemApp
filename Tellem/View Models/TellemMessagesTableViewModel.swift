//
//  TellemMessagesTableViewModel.swift
//  Tellem
//
//  Created by Rubens Neto on 21/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessagesTableViewModel {
    var cellModelSections = [[TellemMessageCellViewModel]]()
    
    init() {
        let userId = UserDefaults.standard.value(forKey: "userId") as! Int
        let amber = TellemUser(id: 11111, name: "Amber Parker", profileImage: UIImage(named: "gatinha1")!)
        let amberMessage2 = TellemMessage(interlocutor: amber, senderId: userId, receiverId: amber.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(4)), status: .read)
        cellModelSections.append([TellemMessageCellViewModel(message:amberMessage2)])
        let amberMessage = TellemMessage(interlocutor: amber, senderId: amber.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages. I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: 0), status: .read)
        amber.newMessages = 1
        amber.lastMessage = amberMessage
        cellModelSections.append([TellemMessageCellViewModel(message:amberMessage)])
    }
    
    private func daysAgo(_ days: Double) -> Double {
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        return -(Double(day) * days)
    }
}
