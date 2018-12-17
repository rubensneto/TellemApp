//
//  TellemViewController.swift
//  Tellem
//
//  Created by Rubens Neto on 17/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import UIKit

class TellemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        edgesForExtendedLayout = []
        
        hideKeyboardWhenTappedAround()
        
        if let nc = navigationController{
            nc.navigationBar.isTranslucent = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
