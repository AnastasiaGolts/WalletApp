//
//  AddTransactionProtocol.swift
//  WalletApp
//
//  Created by Anastasia Golts on 28.12.2022.
//

import Foundation

protocol AddTransactionProtocol: AnyObject {
    func addTransaction(transactionModel: TransactionModel)
}
