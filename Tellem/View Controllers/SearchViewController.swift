//
//  SearchViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 14/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class SearchViewController: TellemViewController {
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTestLabel()
    }
    
    func addTestLabel(){
        view.addSubview(testLabel)
        testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    


}
