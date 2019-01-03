//
//  TellemNewMessagesBadgeView.swift
//  Tellem
//
//  Created by Rubens Neto on 02/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemNewMessagesBadgeView: UIView {
    
    private let newMessageAlertLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Tellem.white
        label.font = UIFont.Tellem.medium
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(newMessages: Int) {
        newMessageAlertLabel.text = "\(newMessages)"
        let labelWidth = newMessageAlertLabel.calculatedWidth
        let frame = CGRect(x: 0, y: 0, width: labelWidth + 10, height: 20)
        super.init(frame: frame)
        backgroundColor = UIColor.Tellem.blue
        layer.cornerRadius = 10
        addSubview(newMessageAlertLabel)
        newMessageAlertLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        newMessageAlertLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
