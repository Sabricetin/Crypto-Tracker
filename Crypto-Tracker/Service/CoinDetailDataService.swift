//
//  CoinDetailDataService.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 24.01.2025.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    var coinsDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        // Ortam değişkenlerinden API URL ve API KEY değerlerini al
        guard let baseURL = ProcessInfo.processInfo.environment["BASE_URL_DETAIL"] else {
            print("⚠️ BASE_URL_DETAIL bulunamadı!")
            return
        }

        let apiKey = ProcessInfo.processInfo.environment["API_KEY_DETAIL"] ?? "" // Eğer API_KEY tanımlı değilse boş bırak
        
        // API key varsa ekle, yoksa sadece baseURL kullan
        let finalURLString = apiKey.isEmpty ?
            "\(baseURL)\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
            :
            "\(baseURL)\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false&api_key=\(apiKey)"

        // URL oluştur
        guard let url = URL(string: finalURLString) else {
            print("⚠️ Geçersiz URL: \(finalURLString)")
            return
        }
        
        // Ağırlıklı olarak URL'den veri çekme işlemi
        coinsDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinsDetails) in
                self?.coinDetails = returnedCoinsDetails
                self?.coinsDetailSubscription?.cancel()
            })
    }
}



/*
import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
     
    var coinsDetailSubscription : AnyCancellable?
    let coin: CoinModel
    
    init (coin: CoinModel) {
        self.coin = coin
        
        getCoinDetails()
    }
    
     func getCoinDetails () {
       

         guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false" )
        else {return}
        
        coinsDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinsDetails) in
                self?.coinDetails = returnedCoinsDetails
                self?.coinsDetailSubscription?.cancel()
            })
        
    }
}
*/
