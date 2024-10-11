//
//  DateFormatter+Extensions.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

extension DateFormatter {
    static var iso8601Full: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }
}
