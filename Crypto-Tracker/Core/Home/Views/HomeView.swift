//
//  HomeView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfilo : Bool = false
    
    
    var body: some View {
        ZStack {
            // Arka Plan Katmanı
            Color.theme.background
                .ignoresSafeArea()
            
            //İçerik Katmanı
            VStack {
               homeHeader
               
                Spacer(minLength: 0)
            }
        }
        
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
   
}

extension HomeView {
    private var homeHeader : some   View {
        HStack {
            CirculeButtonView(iconName: showPortfilo ? "plus" : "info")
                .animation(.none)
                .background(
                    CirculeButtonAnimationView(animate: $showPortfilo)
                )
            Spacer()
            Text(showPortfilo ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CirculeButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfilo ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfilo.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
