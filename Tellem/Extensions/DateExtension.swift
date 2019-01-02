//
//  DateExtension.swift
//  Tellem
//
//  Created by Rubens Neto on 02/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import Foundation

extension Date {
    func string() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        return formatter.string(from: self)
    }
}
