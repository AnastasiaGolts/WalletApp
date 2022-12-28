//
//  BitcoinRequestModel.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

struct BitcoinRequestModel: Codable {
    
    struct Time: Codable {
        let updated: String
        let updatedISO: String
        let updateduk: String
    }
    
    struct Info: Codable {
        let code: String
        let symbol: String
        let rate: String
        let description: String
        let rate_float: Float
    }
    
    struct BPI: Codable {
        let USD: Info
        let GBP: Info
        let EUR: Info
    }
    
    let time: Time
    let disclaimer: String
    let chartName: String
    let bpi: BPI
}
