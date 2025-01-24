//
//  DetailViewModel.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 24.01.2025.
//

import Foundation
import Combine

class DetailViewModel : ObservableObject{
    
    private let coinDetailSerivce : CoinDetailDataService
    private var cancellables = Set<AnyCancellable> ()
    
    init(coin: CoinModel) {
        self.coinDetailSerivce   = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailSerivce.$coinDetails
            .sink { (returnedCoinDetails) in
                print("RECIEVED COİN DETAİL DATA")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
