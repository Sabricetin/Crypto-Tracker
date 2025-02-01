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
        
         //Environment variable'den BASE_RL ve API_KEY al
         
         guard let baseURL = ProcessInfo.processInfo.environment["BASE_URL"] else {
             print("BASE_URL Bulunamadı")
             return
         }
         
         //EĞER API key eklenirse buraya eklenebilir
         let apikey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
         let finalURL = apikey.isEmpty ? baseURL : "\(baseURL)?api_key=\(apikey)"
         
         guard let url = URL(string: finalURL) else {return}
         
        
        coinsSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinsSubscription?.cancel()
            })
        
    }
}
