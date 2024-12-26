//
//  Utility.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import Foundation

class Utility {
    static func getDateInRequiredFormat(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = formatter.date(from: date) {
           
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: date)
            return dateString
        }
       return ""
    }
    
    static func formattedTime(date: String, includeAMPM: Bool = true) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = formatter.date(from: date) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat =  includeAMPM ? "h:mm a" : "h:mm"
            let timeString = timeFormatter.string(from: date)
            return timeString
        }
        return ""
    }
}
