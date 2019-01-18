//
//  DateExtension.swift
//  Tellem
//
//  Created by Rubens Neto on 02/01/2019.
//  Copyright © 2019 Rubens Neto. All rights reserved.
//

import Foundation

extension Date {
    
    func tellemDateString() -> String {
        
        let interval = Calendar.current.dateComponents([.day], from: self, to: Date())
        
        let formatter = DateFormatter()
        
        switch interval.day {
        case 0:
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: self)
        case 1:
            return LocalizedString.yesterday
        case 2, 3, 4, 5:
            let weekday = Calendar.current.component(.weekday, from: self)
            
            return weekdayFrom(weekday)
        default:
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: self)
        }
    }
    
    private func weekdayFrom(_ day: Int) -> String {
        switch day {
        case 1: return LocalizedString.sunday
        case 2: return LocalizedString.monday
        case 3: return LocalizedString.tuesday
        case 4: return LocalizedString.wednesday
        case 5: return LocalizedString.thursday
        case 6: return LocalizedString.friday
        default:
            return LocalizedString.saturday
        }
    }
    
    func hour() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
