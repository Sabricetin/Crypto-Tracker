//
//  Double.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import Foundation

extension Double {
    
    /// Converts a Double into A currency with 2 decimal places
    ///
    /// Double'ı 2 ondalık basamaklı A para birimine dönüştürür
    /// ```
    ///Convert 1234.56 to $1,234.56
    /// ```
    
    private var currencyFormatter2 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
       // formatter.locale = .current      // <- default value
        formatter.currencyCode = "USD"   // <- change currency
        formatter.currencySymbol = "$"   // <- changeCurrency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into A currency as a String with 2 decimal places
    ///
    /// Double'ı 2 ondalık basamaklı bir Dize olarak A para birimine dönüştürür
    /// ```
    ///Convert 1234.56 to "$1,234.56"
    /// ```
    
    
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
        
    }
    
    /// Converts a Double into A currency with 2-6 decimal places
    /// 
    /// Double'ı 2-6 ondalık basamaklı A para birimine dönüştürür
    /// ```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0,123456
    /// ```
    
    private var currencyFormatter6 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
       // formatter.locale = .current      // <- default value
        formatter.currencyCode = "USD"   // <- change currency
        formatter.currencySymbol = "$"   // <- changeCurrency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into A currency as a String with 2-6 decimal places
    ///
    /// Double'ı 2-6 ondalık basamaklı bir Dize olarak A para birimine dönüştürür
    /// ```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0,123456"
    /// ```
    
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
        
    }
    /// Converts a Double into string representation
    ///
    /// Double'ı dize gösterimine dönüştürür
    /// ```
    ///Convert 1.23456 to "1.23"
    /// ```
    
    func asNumberString () -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
