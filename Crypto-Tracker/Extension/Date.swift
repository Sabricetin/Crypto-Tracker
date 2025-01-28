//
//  Date.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 28.01.2025.
//

import Foundation

extension Date {
    
    init(coinGeckoString : String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDataString() -> String {
        return shortFormatter.string(from: self)
    }
}
