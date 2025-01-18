//
//  PortfolioView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 17.01.2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading , spacing: 0) {
                    Text("hi")
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
            })
        }
       
    }
}

#Preview {
    @State var isPresented: Bool = true
      return PortfolioView(isPresented: $isPresented)
}
