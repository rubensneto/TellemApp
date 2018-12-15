//
//  TellemWarningLabel.swift
//  Tellem
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemWarningLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        text = ""
        font = UIFont.systemFont(ofSize: 12)
        textColor = .red
        translatesAutoresizingMaskIntoConstraints = false
    }
}
