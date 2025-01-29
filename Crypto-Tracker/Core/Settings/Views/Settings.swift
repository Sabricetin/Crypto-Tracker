//
//  Settings.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 29.01.2025.
//

import SwiftUI

struct Settings: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let github = URL(string: "https://github.com/Sabricetin")!
    let linkedin = URL(string: "https://www.linkedin.com/in/sabricetin/")!
    let gmail = "sabriyazilim@gmail.com"
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let tiwitter = URL(string: "https://x.com/SabriOSX")!
    
    
    var body: some View {
        NavigationView {
            List {
                swiftfulThinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .accentColor(.blue)
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

extension Settings {
    
    private var swiftfulThinkingSection : some View {
        
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
            Link("Follow on Twitter", destination: tiwitter)
            Link("Follow on Linkedin", destination: linkedin)
            Link("Follow on Github", destination: github)
            
        }
    }
    
    private var coinGeckoSection : some View {
        
        Section(header: Text ("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape((RoundedRectangle(cornerRadius: 20)))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                
            }
            
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }
    private var developerSection : some View {
        
        Section(header: Text ("Developer")) {
            VStack(alignment: .leading) {
                Image("sabri")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100 , height: 100)
                    .clipShape((RoundedRectangle(cornerRadius: 20)))
                Text("This app was developed by Sabri ÇETİN. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading , publishers/subscribers , and data persistance. ")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                
            }
            
            .padding(.vertical)
            Button(action: {
                if let emailURL = URL(string: "mailto:\(gmail)") {
                    UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
                }
            }) {
                Text("Contact via Email")
            }
        }
    }
    
    private var applicationSection : some View {
        
        Section(header: Text ("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
}
