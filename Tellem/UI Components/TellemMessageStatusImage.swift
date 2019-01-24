//
//  TellemMessageStatusImage.swift
//  Tellem
//
//  Created by Rubens Neto on 14/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessageStatusImage {
    let imageName: String // This property is necessary only for unit tests
    let image: UIImage
    
    init(messageStatus: TellemMessageStatus){
        
        switch messageStatus {
        case .pending:
            self.imageName = "messagePendingStatus"
        case .sent:
            self.imageName = "messageSentStatus"
        case .delivered:
            self.imageName = "messageDeliveredStatus"
        case .read:
            self.imageName = "messageReadStatus"
        }
        
        if messageStatus == .read {
            self.image = UIImage(named: self.imageName)!.image(withColor: UIColor.Tellem.blue)
        } else {
            self.image = UIImage(named: self.imageName)!
        }
    }
}
