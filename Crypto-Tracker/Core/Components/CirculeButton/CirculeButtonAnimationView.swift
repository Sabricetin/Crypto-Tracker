//
//  CirculeButtonAnimationView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import SwiftUI

struct CirculeButtonAnimationView: View {
    
    @Binding  var animate : Bool
    var body: some View {
        Circle()
            .stroke(lineWidth:5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 00 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
            
    }
}

#Preview {
    CirculeButtonAnimationView(animate: .constant(false))
        .foregroundColor(.red)
        .frame(width: 100, height: 100)
}
