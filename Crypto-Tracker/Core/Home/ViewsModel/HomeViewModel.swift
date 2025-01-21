//
//  HomeViewModel.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 14.01.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistic : [StatisticModel] = []
    
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var isLoading : Bool = false
    
    @Published var searchText : String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init () {
       addSubscribers()
    }
    func addSubscribers() {
        
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.6), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        
        // updates portfolioCoins
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntites)
            .map(mapAllCoinsToPortfolioCoins)
            
            .sink { [weak self] (reutrnedCoins) in
                self?.portfolioCoins = reutrnedCoins
            }
            .store(in: &cancellables)
        
        // updates marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
        
            
            .sink { [weak self] (returnedStats) in
                self?.statistic = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
    
    }
        
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData () {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        
        // Kontrol: Tüm verilerin başarılı şekilde gelip gelmediğini kontrol et
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
               let coinDataLoaded = !(self?.coinDataService.allCoins.isEmpty ?? true) // Coin verileri kontrolü
               let marketDataLoaded = self?.marketDataService.marketData != nil // Market verisi kontrolü

               if coinDataLoaded && marketDataLoaded {
                   HapticManager.notification(type: .success) // Başarı geri bildirimi
               } else {
                   HapticManager.notification(type: .error) // Hata geri bildirimi
               }

               self?.isLoading = false // Yükleme durumu tamamlandı
           }
       
        
    }
    
    
    private func filterCoins(text: String , coins: [CoinModel]) -> [CoinModel] {
        
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
            
        }
    }
    
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel] , portfolioEntities: [PortfolioEntity])-> [CoinModel] {
        
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
        
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel? , portfolioCoins: [CoinModel] ) -> [StatisticModel] {
        
        var stats : [StatisticModel] = []
        guard let data = marketDataModel else {
            return stats
        }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        
        
        let portfolioValue = 
        portfolioCoins
            .map({ $0.currentHoldingsValue })
            .reduce(0, +)
        
        // CHATGPT'ye mantığını sor
        let previousValue =
        portfolioCoins
            .map { (coin) -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = (coin.priceChangePercentage24H ?? 0) / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
        
            .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
         //yüzdelik değer     =  (pörtfey değeri  -    önceki değer) / öceki değer * 100
        
        let portfolio = StatisticModel(
            title: "Portfolio Value",
            value: portfolioValue.asCurrencyWith2Decimals(),
            percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap ,
            volume ,
            btcDominance ,
            portfolio
        ])
        return stats
    }
        
    
}
