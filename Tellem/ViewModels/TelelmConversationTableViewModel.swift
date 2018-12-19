//
//  TelelmConversationTableViewModel.swift
//  Tellem
//
//  Created by Rubens Neto on 19/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemConversationTableViewModel {
    
    var cellModels = [TellemConversationCellViewModel]()
    
    init(){
        let amber = TellemConversationCellViewModel(indexPath: IndexPath(item: cellModels.count, section: 0), profileName: "Amber Tyler", profileImage: UIImage(named: "gatinha1"), lastMessage: "Yeah, I really enjoyed my night", lastMessageTimestamp: "12:11", newMessages: "4")
        cellModels.append(amber)
        
        let carol = TellemConversationCellViewModel(indexPath: IndexPath(item: cellModels.count, section: 0), profileName: "Carol Smith", profileImage: UIImage(named: "gatinha2"), lastMessage: "So when are you free next?", lastMessageTimestamp: "02:13", newMessages: "2")
        cellModels.append(carol)
        
        let jane = TellemConversationCellViewModel(indexPath: IndexPath(item: cellModels.count, section: 0), profileName: "Jane Harper", profileImage: UIImage(named: "gatinha3"), lastMessage: "Hey why don't answer me anymore?", lastMessageTimestamp: "Yesterday", newMessages: "11")
        cellModels.append(jane)
        
        let lisa = TellemConversationCellViewModel(indexPath: IndexPath(item: cellModels.count, section: 0), profileName: "Amber Tyler", profileImage: UIImage(named: "gatinha4"), lastMessage: "Yeah, I really enjoyed my night", lastMessageTimestamp: "Monday", newMessages: "4")
        cellModels.append(lisa)
        
        let kate = TellemConversationCellViewModel(indexPath: IndexPath(item: cellModels.count, section: 0), profileName: "Kate Marshal", profileImage: UIImage(named: "gatinha5"), lastMessage: "Yeah, I really enjoyed my night", lastMessageTimestamp: "07/12/2018", newMessages: "4")
        cellModels.append(kate)
    }
}
