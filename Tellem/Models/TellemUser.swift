//
//  TellemUser.swift
//  Tellem
//
//  Created by User on 17/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

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
