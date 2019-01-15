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
        let messages = TellemMessageDataSource().messages
        for message in messages {
            cellModels.append(TellemConversationCellViewModel(message: message))
        }
    }
}
