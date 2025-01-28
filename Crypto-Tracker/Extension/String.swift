//
//  String.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 28.01.2025.
//

import Foundation


extension String {
    
    var removingHTMLOccurances : String {
        
        return self.replacingOccurrences(of: "<[^>]+>", with: "" , options: .regularExpression , range: nil)
    }
}
