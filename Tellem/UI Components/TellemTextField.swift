//
//  TellemTextField.swift
//  Tellem
//
//  Created by User on 13/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemTextField: UITextField {
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(bottomView)
        bottomView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomView.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
}
