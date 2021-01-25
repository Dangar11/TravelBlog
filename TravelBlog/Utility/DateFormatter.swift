//
//  DateFormatter.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import Foundation


let date = Date()
let formate = date.getFormattedDate(format: "MM-dd-yyyy HH:mm") // Set output formate

extension Date {
   func getFormattedDate(format: String = "MMM d, h:mm a") -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
