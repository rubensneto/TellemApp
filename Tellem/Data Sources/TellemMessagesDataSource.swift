//
//  MessagesDataSource.swift
//  Tellem
//
//  Created by Rubens Neto on 21/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessageDataSource {
     //TODO: test that cellViewModels is not equal to nil before initialize
    var messages = [TellemMessage]()
    
    private let userId = UserDefaults.standard.value(forKey: "userId") as! Int
    
    private let amber = TellemUser(id: 11111, name: "Amber Parker", profileImage: UIImage(named: "gatinha1")!)
    private let lisa = TellemUser(id: 22222, name: "Lisa Michels", profileImage: UIImage(named: "gatinha2")!)
    private let zoe = TellemUser(id: 33333, name: "Zoe Baker", profileImage: UIImage(named: "gatinha3")!)
    private let nathaly = TellemUser(id: 44444, name: "Nathaly Harver", profileImage: UIImage(named: "gatinha4")!)
    private let kate = TellemUser(id: 55555, name: "Kate Peterson", profileImage: UIImage(named: "gatinha5")!)
    private let jessie = TellemUser(id: 66666, name: "Jessie Williams", profileImage: UIImage(named: "gatinha6")!)
    private let ashleigh = TellemUser(id: 77777, name: "Ashleigh Parker", profileImage: UIImage(named: "gatinha7")!)
    private let molly = TellemUser(id: 88888, name: "Molly Chamber", profileImage: UIImage(named: "gatinha8")!)
    private let rachel = TellemUser(id: 99999, name: "Rachel Hampsey", profileImage: UIImage(named: "gatinha9")!)
    private let gina = TellemUser(id: 00000, name: "Gina Jordan", profileImage: UIImage(named: "gatinha0")!)
    
    init(){
        
        let amberMessage = TellemMessage(interlocutor: amber, senderId: amber.id, receiverId: userId, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: 0), status: .delivered)
        amber.newMessages = 1
        amber.lastMessage = amberMessage
        messages.append(amberMessage)
        let lisaMessage = TellemMessage(interlocutor: lisa, senderId: userId, receiverId: lisa.id, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -60), status: .delivered)
        lisa.lastMessage = lisaMessage
        messages.append(lisaMessage)
        let zoeMessage = TellemMessage(interlocutor: zoe, senderId: zoe.id, receiverId: userId, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -120), status: .read)
        zoe.lastMessage = zoeMessage
        messages.append(zoeMessage)
        let nathalyMessage = TellemMessage(interlocutor: nathaly, senderId: userId, receiverId: nathaly.id, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -180), status: .read)
        nathaly.lastMessage = nathalyMessage
        messages.append(nathalyMessage)
        let kateMessage = TellemMessage(interlocutor: kate, senderId: kate.id, receiverId: userId, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -240), status: .sent)
        kate.newMessages = 7
        kate.lastMessage = kateMessage
        messages.append(kateMessage)
        let jessieMessage = TellemMessage(interlocutor: jessie, senderId: userId, receiverId: jessie.id, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -300), status: .sent)
        jessie.lastMessage = jessieMessage
        messages.append(jessieMessage)
        let ashleighMessage = TellemMessage(interlocutor: ashleigh, senderId: ashleigh.id, receiverId: userId, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -360), status: .delivered)
        ashleigh.newMessages = ashleigh.newMessages + 1
        ashleigh.lastMessage = ashleighMessage
        messages.append(ashleighMessage)
        let mollyMessage = TellemMessage(interlocutor: molly, senderId: userId, receiverId: molly.id, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -420), status: .pending)
        molly.lastMessage = mollyMessage
        messages.append(mollyMessage)
        let rachelMessage = TellemMessage(interlocutor: rachel, senderId: rachel.id, receiverId: userId, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -480), status: .delivered)
        rachel.newMessages = 123
        rachel.lastMessage = rachelMessage
        messages.append(rachelMessage)
        let ginaMessage = TellemMessage(interlocutor: gina, senderId: userId, receiverId: gina.id, type: .text, text: "Hey", timeStamp: Date(timeIntervalSinceNow: -540), status: .delivered)
        gina.newMessages = 23
        gina.lastMessage = ginaMessage
        messages.append(ginaMessage)
    }
}
