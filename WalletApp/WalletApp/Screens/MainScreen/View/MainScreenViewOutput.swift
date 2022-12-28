//
//  MainScreenViewOutput.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

protocol MainScreenViewOutput: AnyObject {
    func showTransactionScreen()
    func showAddMoneyScreen()
    func fetchTransactionData(pagination: Bool) -> [TransactionModel]
}
