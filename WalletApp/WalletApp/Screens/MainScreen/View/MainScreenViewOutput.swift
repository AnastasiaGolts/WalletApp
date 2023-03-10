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
    func fetchTransactionData()
    func getNumberOfSections() -> Int
    func getNumberOfRowsInSection(section: Int) -> Int
    func getCellInfo(indexPath: IndexPath) -> TransactionModel
    func getSectionName(section: Int) -> String
    func getBalanceInfo() -> String
    func getBitcoinPrice() async -> String
}
