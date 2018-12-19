//
//  TellemConversationCellViewModel.swift
//  Tellem
//
//  Created by Rubens Neto on 19/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

struct TellemConversationCellViewModel {
    var indexPath: IndexPath!
    var profileName: String!
    var profileImage: UIImage!
    var lastMessage: String!
    var lastMessageTimestamp: String!
    var newMessages: String!
}
