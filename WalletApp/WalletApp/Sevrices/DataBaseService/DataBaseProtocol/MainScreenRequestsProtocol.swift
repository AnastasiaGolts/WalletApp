//
//  MainScreenRequestsProtocol.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

protocol MainScreenRequestsProtocol: AnyObject {
    var isPaginating: Bool { get set }
    func fetchData(pagination: Bool, completion: @escaping (Result<[TransactionModel], Error>) -> Void)
}
