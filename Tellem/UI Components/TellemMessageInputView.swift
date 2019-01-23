//
//  TellemMessaegeInputView.swift
//  Tellem
//
//  Created by Rubens Neto on 21/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import UIKit

class TellemMessageInputView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var sendMediaButton: UIButton!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("TellemMessageInputView", owner: self, options: nil)
        self.addSubview(self.view);
        inputTextView.layer.cornerRadius = 15
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
