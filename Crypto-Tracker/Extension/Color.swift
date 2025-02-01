//
//  Color.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme2()
    static let launch = LaunchTheme()
    
}


struct ColorTheme {
    
    let accent = Color ("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color ("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct ColorTheme2 {
    
    let accent = Color(UIColor(red: 240/255, green: 185/255, blue: 11/255, alpha: 1.0))
    let background = Color(UIColor(red: 30/255, green: 35/255, blue: 41/255, alpha: 1.0))
    let green = Color ("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color(UIColor(red: 240/255, green: 185/255, blue: 11/255, alpha: 1.0))
}


struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}
