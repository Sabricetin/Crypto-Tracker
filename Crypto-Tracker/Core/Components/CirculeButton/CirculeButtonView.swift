//
//  CirculeButtonView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import SwiftUI



struct CirculeButtonView: View {
    let iconName : String
    var body: some View {
      Image(systemName:  iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50 , height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10 , x: 0 , y: 0)
            .padding()
    }
}

struct CirculeButtonView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CirculeButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            CirculeButtonView(iconName: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
        }
      
    }
    
}


