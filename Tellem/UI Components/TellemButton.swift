//
//  TellemTitleAndBackgroundButton.swift
//  Tellem
//
//  Created by User on 16/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String){
        self.init(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        setTitle(title.uppercased() , for: .normal)
        titleLabel?.font = UIFont.Tellem.mediumBold
        backgroundColor = UIColor.Tellem.green
        layer.cornerRadius = 2
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
