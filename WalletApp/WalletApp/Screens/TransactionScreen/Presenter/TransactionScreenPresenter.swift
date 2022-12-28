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
    private let dataBaseService: DataBaseProtocol
    
    private var receivedAmount = ""
    private var receivedTransactionType: TransactionType = .notChosen
    
    init(output: TransactionScreenModuleOutput, dataBaseService: DataBaseProtocol) {
        self.dataBaseService = dataBaseService
        self.output = output
    }

}

extension TransactionScreenPresenter: TransactionScreenViewOutput {
    func returnToMainScreen() {
        guard Double(receivedAmount) != nil else {
            view?.showEmptyAmountAlert()
            return
        }
        
        guard receivedTransactionType != .notChosen else {
            view?.showEmptyTransactionTypeAlert()
            return
        }
        
        output.returnToMainModule()
    }
    
    func getAmountOfMoney(amount: String?) {
        receivedAmount = amount ?? ""
    }
    
    func getTransactionType(type: TransactionType) {
        receivedTransactionType = type
    }
}
