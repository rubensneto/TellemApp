//
//  TellemTextButton.swift
//  Tellem
//
//  Created by User on 16/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemTextButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String){
        self.init(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        setTitle(title.uppercased(), for: .normal)
        setTitleColor(UIColor.Tellem.green, for: .normal)
        titleLabel?.font = UIFont.Tellem.medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
