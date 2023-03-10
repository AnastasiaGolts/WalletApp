//
//  NetworkServiceProtocol.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func fetchBitcoinPrice() async throws -> Float
}
