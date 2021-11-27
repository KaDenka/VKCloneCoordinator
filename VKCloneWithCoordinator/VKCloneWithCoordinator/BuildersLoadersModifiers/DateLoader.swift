//
//  DateLoader.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 09.11.2021.
//

import Foundation

class DateLoader {
    let dateFormatter = DateFormatter()
    
    func transformDateFormat(_ id: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(id))
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM yy HH:mm"
        return dateFormatter.string(from: date)
    }
}
