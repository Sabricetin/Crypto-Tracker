//
//  HomeView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 13.01.2025.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showPortfilo : Bool = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    
    
    var body: some View {
        ZStack {
            // Arka Plan Katmanı
            Color.theme.background
                .ignoresSafeArea()
                .sheet (isPresented : $showPortfolioView , content:  {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            //İçerik Katmanı
            VStack {
                homeHeader
                homeStatesView(showPortfolio: $showPortfilo)
                
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !showPortfilo {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                if showPortfilo {
                    portfolioCoinlist
                        .transition(.move(edge: .trailing))
                }
                
               
                Spacer(minLength: 0)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

/*
#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
} */

extension HomeView {
    private var homeHeader : some   View {
        HStack {
            CirculeButtonView(iconName: showPortfilo ? "plus" : "info")
                .animation(.none)
                .onTapGesture {
                    if showPortfilo {
                        showPortfolioView.toggle()
                        
                    }
                }
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
    private var allCoinsList:some View {
        List {
            ForEach(vm.allCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portfolioCoinlist : some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles :some   View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfilo {
                Text("Holdings")
            }
           
            Text("Price")
                .frame(width: UIScreen.main.bounds.width /  3.5 , alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}

