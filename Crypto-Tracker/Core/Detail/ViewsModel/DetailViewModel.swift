//
//  DetailViewModel.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 24.01.2025.
//

import Foundation
import Combine

class DetailViewModel : ObservableObject{
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    
    @Published var  coin : CoinModel
    private let coinDetailSerivce : CoinDetailDataService
    private var cancellables = Set<AnyCancellable> ()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailSerivce   = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailSerivce.$coinDetails
        
            .combineLatest($coin)
            .map(mapDataToStatistics)
        
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional

            }
            .store(in: &cancellables)
    }
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel? , coinModel: CoinModel) -> (overview: [StatisticModel] , additional: [StatisticModel]) {
     
        let overviewArray = createOverViewArray(coinModel: coinModel)
        let additionalArray = createAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel)
        
        return( overviewArray , additionalArray)
    }
    
    private func createOverViewArray(coinModel: CoinModel) -> [StatisticModel] {
        
        //Overview -> Genel bakış
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price , percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "MArket Capitalization ", value: marketCap , percentageChange: marketCapPercentChange)
        
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        var overviewArray: [StatisticModel] = [
            priceStat , marketCapStat , rankStat , volumeStat
        
        ]
        return overviewArray
    }
    private func createAdditionalArray(coinDetailModel: CoinDetailModel? , coinModel: CoinModel) -> [StatisticModel] {
        
        
        //Additional -> Ek olarak
        
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "N/A"
        let highStat = StatisticModel(title: "24h Hignh", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "N/A"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "N/A"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h MArket Cap Change ", value: marketCapChange , percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "N/A" : "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time ", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "N/A"
        let hashingStats = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray : [ StatisticModel] = [
        highStat , lowStat  , priceChangeStat , marketCapChangeStat ,  blockStat , hashingStats
        ]
        return additionalArray
    }
}
