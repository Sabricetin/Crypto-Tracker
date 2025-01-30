//
//  CoinDataService.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 14.01.2025.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    var coinsSubscription : AnyCancellable?
    
    init () {
        getCoins()  
    }
    
     func getCoins () {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h" )
        else {return}
        
        coinsSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinsSubscription?.cancel()
            })
        
    }
}
