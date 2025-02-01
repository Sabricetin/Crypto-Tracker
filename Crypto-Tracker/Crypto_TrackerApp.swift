//
//  Crypto_TrackerApp.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import SwiftUI

@main
struct Crypto_TrackerApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView : Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear

    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))

                    }
                }
                .zIndex(2.0)
                
            }
           
        }
    }
}
