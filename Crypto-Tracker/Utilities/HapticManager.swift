//
//  HapticManager.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 21.01.2025.
//

import Foundation
import SwiftUI

class HapticManager  {
    
    static private var generator = UINotificationFeedbackGenerator()
    
    static func notification (type: UINotificationFeedbackGenerator.FeedbackType ) {
        generator.notificationOccurred(type)
    }
    
}
