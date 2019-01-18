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
    private let gina = TellemUser(id: 12121, name: "Gina Jordan", profileImage: UIImage(named: "gatinha0")!)
    private let camila = TellemUser(id: 13131, name: "Camila Grande", profileImage: UIImage(named: "gatinha11")!)
    private let tereza = TellemUser(id: 14141, name: "Tereza May", profileImage: UIImage(named: "gatinha12")!)
    private let kiki = TellemUser(id: 15151, name: "Kiki", profileImage: UIImage(named: "gatinha13")!)
    private let liv = TellemUser(id: 16161, name: "Liv Tayler", profileImage: UIImage(named: "gatinha14")!)
    private let janet = TellemUser(id: 17171, name: "Janet Jackson", profileImage: UIImage(named: "gatinha15")!)
    private let rubi = TellemUser(id: 18181, name: "Rubi Rubi", profileImage: UIImage(named: "gatinha16")!)
    private let anna = TellemUser(id: 19191, name: "Anna Balena", profileImage: UIImage(named: "gatinha17")!)
    private let lauren = TellemUser(id: 10101, name: "Lauren Martin", profileImage: UIImage(named: "gatinha18")!)
    private let megan = TellemUser(id: 21212, name: "Megan Fox", profileImage: UIImage(named: "gatinha19")!)
    private let nicole = TellemUser(id: 23232, name: "Nicole Kidman", profileImage: UIImage(named: "gatinha10")!)
    
    init(){
        
        let ginaMessage = TellemMessage(interlocutor: gina, senderId: gina.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(400)), status: .delivered)
        gina.newMessages = 23
        gina.lastMessage = ginaMessage
        messages.append(ginaMessage)
        let amberMessage = TellemMessage(interlocutor: amber, senderId: amber.id, receiverId: userId, type: .text, text: "I'm a realy long message cause", timeStamp: Date(timeIntervalSinceNow: 0), status: .delivered)
        amber.newMessages = 1
        amber.lastMessage = amberMessage
        messages.append(amberMessage)
        let amberMessage2 = TellemMessage(interlocutor: amber, senderId: userId, receiverId: amber.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: -4), status: .read)
        messages.append(amberMessage2)
        let lisaMessage = TellemMessage(interlocutor: lisa, senderId: userId, receiverId: lisa.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(35)), status: .delivered)
        lisa.lastMessage = lisaMessage
        messages.append(lisaMessage)
        let zoeMessage = TellemMessage(interlocutor: zoe, senderId: zoe.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(7)), status: .read)
        zoe.lastMessage = zoeMessage
        messages.append(zoeMessage)
        let nathalyMessage = TellemMessage(interlocutor: nathaly, senderId: userId, receiverId: nathaly.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(6)), status: .read)
        nathaly.lastMessage = nathalyMessage
        messages.append(nathalyMessage)
        let kateMessage = TellemMessage(interlocutor: kate, senderId: kate.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long message", timeStamp: Date(timeIntervalSinceNow: daysAgo(5)), status: .sent)
        kate.newMessages = 7
        kate.lastMessage = kateMessage
        messages.append(kateMessage)
        let jessieMessage = TellemMessage(interlocutor: jessie, senderId: userId, receiverId: jessie.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(4)), status: .sent)
        jessie.lastMessage = jessieMessage
        messages.append(jessieMessage)
        let ashleighMessage = TellemMessage(interlocutor: ashleigh, senderId: ashleigh.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(3)), status: .delivered)
        ashleigh.newMessages = 5
        ashleigh.lastMessage = ashleighMessage
        messages.append(ashleighMessage)
        let mollyMessage = TellemMessage(interlocutor: molly, senderId: userId, receiverId: molly.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(2)), status: .pending)
        molly.lastMessage = mollyMessage
        messages.append(mollyMessage)
        let rachelMessage = TellemMessage(interlocutor: rachel, senderId: rachel.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(1)), status: .delivered)
        rachel.newMessages = 123
        rachel.lastMessage = rachelMessage
        messages.append(rachelMessage)
        let camilaMessage = TellemMessage(interlocutor: camila, senderId: userId, receiverId: camila.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(200)), status: .delivered)
        camila.newMessages = 36
        camila.lastMessage = camilaMessage
        messages.append(camilaMessage)
        let terezaMessage = TellemMessage(interlocutor: tereza, senderId: tereza.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(24.6)), status: .delivered)
        tereza.newMessages = 81
        tereza.lastMessage = terezaMessage
        messages.append(terezaMessage)
        let kikiMessage = TellemMessage(interlocutor: kiki, senderId: userId, receiverId: kiki.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(24)), status: .delivered)
        kiki.lastMessage = kikiMessage
        messages.append(kikiMessage)
        let livMessage = TellemMessage(interlocutor: liv, senderId: liv.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(14.5)), status: .read)
        liv.lastMessage = livMessage
        messages.append(livMessage)
        let janetMessage = TellemMessage(interlocutor: janet, senderId: userId, receiverId: janet.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(12.5)), status: .read)
        janet.lastMessage = janetMessage
        messages.append(janetMessage)
        let rubiMessage = TellemMessage(interlocutor: rubi, senderId: rubi.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(55)), status: .sent)
        rubi.newMessages = 17
        rubi.lastMessage = rubiMessage
        messages.append(rubiMessage)
        let annaMessage = TellemMessage(interlocutor: anna, senderId: userId, receiverId: anna.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(4)), status: .sent)
        anna.lastMessage = annaMessage
        messages.append(annaMessage)
        let laurenMessage = TellemMessage(interlocutor: lauren, senderId: lauren.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(3.6)), status: .delivered)
        lauren.newMessages = 6
        lauren.lastMessage = laurenMessage
        messages.append(laurenMessage)
        let meganMessage = TellemMessage(interlocutor: megan, senderId: userId, receiverId: megan.id, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(8.8)), status: .pending)
        megan.lastMessage = meganMessage
        messages.append(meganMessage)
        let nicoleMessage = TellemMessage(interlocutor: nicole, senderId: nicole.id, receiverId: userId, type: .text, text: "I'm a realy long message cause Rubens needs to test the cell behavior with long messages", timeStamp: Date(timeIntervalSinceNow: daysAgo(5.1)), status: .delivered)
        nicole.newMessages = 1102
        nicole.lastMessage = nicoleMessage
        messages.append(nicoleMessage)
        
        messages = messages.sorted(by: { $0.timeStamp.compare($1.timeStamp) == .orderedDescending })
    }
    
    func daysAgo(_ days: Double) -> Double {
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        return -(Double(day) * days)
    }
}
