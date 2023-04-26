//
//  DetailViewModel.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 4/25/23.
//

import Combine
import Foundation

class DetailViewModel: ObservableObject {
    
    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetails
            .sink { (returnedCoinDetails) in
                print("RECIEVED DATA")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
