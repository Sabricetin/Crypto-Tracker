//
//  Settings.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 29.01.2025.
//

import SwiftUI

struct Settings: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let github = URL(string: "https://github.com/Sabricetin")
    let linkedin = URL(string: "https://www.linkedin.com/in/sabricetin/")
    let gmail = URL(string: "sabriyazilim@gmail.com")
    let coingeckoURL = URL(string: "https://www.coingecko.com")
    let tiwitter = URL(string: "https://x.com/SabriOSX")
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text ("Sabri ÇETİN")) {
                    VStack(alignment: .leading) {
                        Image("logo")
                            .resizable()
                            .frame(width: 100 , height: 100)
                            .clipShape((RoundedRectangle(cornerRadius: 20)))
                        Text("This application. MVVM Architecture, Combine and CoreData were done")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(Color.theme.accent)
                        
                    }
                    
                    .padding(.vertical)
                    Link("Follow on Twitter", destination: tiwitter!)
                }
                
            }
            .font(.headline)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
            }
        }
       
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
