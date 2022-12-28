//
//  TransactionScreenPresenter.swift
//  WalletApp
//
//  Created by Anastasia Golts on 27.12.2022.
//

import Foundation

final class TransactionScreenPresenter {
    
    // MARK: - Properties
    
    weak var view: TransactionScreenViewInput?
    
    private let output: TransactionScreenModuleOutput
    private let dataBaseService: AddTransactionProtocol
    
    private var receivedAmount = ""
    private var receivedTransactionType: TransactionType = .notChosen
    
    init(output: TransactionScreenModuleOutput, dataBaseService: AddTransactionProtocol) {
        self.dataBaseService = dataBaseService
        self.output = output
    }

}

extension TransactionScreenPresenter: TransactionScreenViewOutput {
    func returnToMainScreen() {
        guard let receivedAmount = Double(receivedAmount) else {
            view?.showEmptyAmountAlert()
            return
        }
        
        guard receivedTransactionType != .notChosen else {
            view?.showEmptyTransactionTypeAlert()
            return
        }
        
        guard var value = UserDefaults.standard.getValueForBalance() else {
            return
        }
        value -= receivedAmount
        UserDefaults.standard.setValueForBalance(value: value)
        
        let transactionModel = TransactionModel(dayOfTransaction: WalletAppDateFormatter.setDateTime().date,
                                                timeOfTransaction: WalletAppDateFormatter.setDateTime().time,
                                                amount: receivedAmount,
                                                transactionType: receivedTransactionType.title)
        dataBaseService.addTransaction(transactionModel: transactionModel)
        output.returnToMainModule()
    }
    
    func getAmountOfMoney(amount: String?) {
        receivedAmount = amount ?? ""
    }
    
    func getTransactionType(type: TransactionType) {
        receivedTransactionType = type
    }
}
