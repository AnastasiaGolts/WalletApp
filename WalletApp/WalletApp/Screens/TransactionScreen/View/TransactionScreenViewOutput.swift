//
//  TransactionScreenViewOutput.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation
 
protocol TransactionScreenViewOutput: AnyObject {
    func returnToMainScreen()
    func getAmountOfMoney(amount: Double)
    func getTransactionType(type: TransactionType)
}
