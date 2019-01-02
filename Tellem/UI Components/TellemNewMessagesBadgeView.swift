//
//  TellemNewMessagesBadgeView.swift
//  Tellem
//
//  Created by Rubens Neto on 02/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemNewMessagesBadgeView: UIView {
    
    public var newMessagesCount: Int? {
        didSet {
            if let count = newMessagesCount, count > 0 {
                backgroundColor = UIColor.Tellem.blue
                layer.cornerRadius = 10
                
                addSubview(newMessageAlertLabel)
                newMessageAlertLabel.text = "\(count)"
                
                let maxValue = max(newMessageAlertLabel.calculatedWidth + 12, newMessageAlertLabel.calculatedHeight)
                
                self.frame.size.width = maxValue
                widthAnchor.constraint(equalToConstant: maxValue)
                heightAnchor.constraint(equalToConstant: maxValue)
                newMessageAlertLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
                newMessageAlertLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            }
        }
    }
    
    private let newMessageAlertLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Tellem.white
        label.font = UIFont.Tellem.medium
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
