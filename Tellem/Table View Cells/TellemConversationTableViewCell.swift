//
//  TellemConversationTableViewCell.swift
//  Tellem
//
//  Created by Rubens Neto on 17/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemConversationTableViewCell: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.image = UIImage(named: "Rubens")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rubens Neto"
        label.font = UIFont.Tellem.mediumBold
        return label
    }()
    
    let timeStampLabel: UILabel = {
        let label = UILabel()
        label.text = "14:56"
        label.font = UIFont.Tellem.medium
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's build it!"
        label.font = UIFont.Tellem.mediumSmall
        return label
    }()
    
    let newMessageAlertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tellem.blue
        view.layer.cornerRadius = 6
        return view
    }()
    
    let newMessageAlertLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Tellem.white
        label.font = UIFont.Tellem.medium
        label.text = "23"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpLayout(){
        
        addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        addSubview(timeStampLabel)
        timeStampLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        timeStampLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        timeStampLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(greaterThanOrEqualTo: timeStampLabel.leftAnchor, constant: -6).isActive = true

        addSubview(messageLabel)
        messageLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 12).isActive = true
        
        addSubview(newMessageAlertView)
        addSubview(newMessageAlertLabel)
        newMessageAlertLabel.topAnchor.constraint(equalTo: timeStampLabel.bottomAnchor, constant: 6).isActive = true
        newMessageAlertLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        newMessageAlertView.setContentHuggingPriority(.required, for: .horizontal)
        
        newMessageAlertView.centerYAnchor.constraint(equalTo: newMessageAlertLabel.centerYAnchor).isActive = true
        newMessageAlertView.centerXAnchor.constraint(equalTo: newMessageAlertLabel.centerXAnchor).isActive = true
        newMessageAlertView.heightAnchor.constraint(equalTo: newMessageAlertLabel.heightAnchor).isActive = true
        let newMessageAlertViewWidthConstraint =  newMessageAlertView.widthAnchor.constraint(equalTo: newMessageAlertLabel.widthAnchor)
        newMessageAlertViewWidthConstraint.isActive = true
        newMessageAlertViewWidthConstraint.constant = newMessageAlertViewWidthConstraint.constant + 4
        
        setSubviewsAutoResizingMask()
    }
    
    func setSubviewsAutoResizingMask(){
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}
