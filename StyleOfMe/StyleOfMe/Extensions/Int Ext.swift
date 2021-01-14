//
//  Int Ext.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/9/21.
//

import Foundation
extension Int {
    func incrementWeekDays(by num: Int) -> Int {
        let incrementedVal = self + num
        let mod = incrementedVal % 7
        
        return mod
    }
}
extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "XXXX"
        return dateFormatter.string(from: self).capitalized
    }
}
