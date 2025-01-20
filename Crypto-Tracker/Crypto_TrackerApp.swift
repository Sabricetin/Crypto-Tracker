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
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]

    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
