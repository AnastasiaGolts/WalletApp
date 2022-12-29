//
//  NetworkService.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    func fetchBitcoinPrice() async throws -> Float {
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            return Float()
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        
        if let shouldUpdate = UserDefaults.standard.getValueShouldUpdateBitcoin() {
            if !shouldUpdate {
                request = URLRequest(url: url, cachePolicy: .returnCacheDataDontLoad)
            }
        }
    
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decodedData = try JSONDecoder().decode(BitcoinRequestModel.self, from: data)
        
        return decodedData.bpi.USD.rate_float
    }
}
