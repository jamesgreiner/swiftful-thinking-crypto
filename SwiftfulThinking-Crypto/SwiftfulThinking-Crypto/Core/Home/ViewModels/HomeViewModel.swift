//
//  HomeViewModel.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 4/11/23.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var statistics: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // Updates all coins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // Update market data
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
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
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel]{
            var stats: [StatisticModel] = []
            guard let data = marketDataModel else {
                return stats
            }
                        
            let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
            
            let volume = StatisticModel(title: "24h Volume", value: data.volume)
            
            let bitcoinDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)

            let portfolioValue = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0.00)

            stats.append(contentsOf: [
                marketCap,
                volume,
                bitcoinDominance,
                portfolioValue
            ])
            
            return stats
    }
}
