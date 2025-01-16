//
//  UIApplication.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 16.01.2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
