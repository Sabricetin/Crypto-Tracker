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
    
    private func getCoins () {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&x_cg_demo_api_key=CG-2CT1LVGC82DktPhiEfZXWVZ9" )
        else {return}
        
     coinsSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse ,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished :
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinsSubscription?.cancel()
            }

        
        
        
    }
}
