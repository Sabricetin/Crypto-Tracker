//
//  ContentView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
                
            } .font(.headline)
        }
       
        
    }
}

#Preview {
    ContentView()
}
