//
//  AddMoneyViewOutput.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

protocol AddMoneyViewOutput: AnyObject {
    func returnToMainScreen()
    func getAmountOfMoney(amount: String?)
}
