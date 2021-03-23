//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 21-03-21.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormater.locale = Locale(identifier: "es_CL")
        dateFormater.timeZone = .current
        
        return dateFormater.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
}
