//
//  AddMoneyPresenter.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

final class AddMoneyPresenter {
    
    // MARK: - Properties
    
    weak var view: AddMoneyViewInput?
    
    private let output: AddMoneyModuleOutput
    private let dataBase: AddTransactionProtocol
    
    private var receivedAmount = ""
    
    init(output: AddMoneyModuleOutput, dataBase: AddTransactionProtocol) {
        self.output = output
        self.dataBase = dataBase
    }
    
}

// MARK: - AddMoneyViewOutput

extension AddMoneyPresenter: AddMoneyViewOutput {
    func submit() {
        guard let amount = Double(receivedAmount) else {
            view?.showEmptyAlert()
            return
        }
        
        guard var value = UserDefaults.standard.getValueForBalance() else {
            return
        }
        value += amount
        UserDefaults.standard.setValueForBalance(value: value)
        
        let transactionModel = TransactionModel(dayOfTransaction: WalletAppDateFormatter.setDateTime().date,
                                                timeOfTransaction: WalletAppDateFormatter.setDateTime().time,
                                                amount: amount,
                                                transactionType: "Added money")
        dataBase.addTransaction(transactionModel: transactionModel)
        output.returnToMain()
    }
    
    func getAmountOfMoney(amount: String?) {
        receivedAmount = amount ?? ""
    }
}
