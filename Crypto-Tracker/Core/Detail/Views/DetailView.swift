//
//  DetailView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 22.01.2025.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var  coin : CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
        
    }
}

struct DetailView: View {

    let coin : CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing detail view for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)

        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
